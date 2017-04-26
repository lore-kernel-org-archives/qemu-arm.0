Received: by 10.25.0.144 with SMTP id 138csp133470lfa;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
X-Received: by 10.55.22.160 with SMTP id 32mr22422216qkw.89.1493187810836;
        Tue, 25 Apr 2017 23:23:30 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id t184si24570976qkh.288.2017.04.25.23.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6303321B79;
	Wed, 26 Apr 2017 02:23:30 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=kNv2ej/zqNXDKOPS5t00Vv7ANnb
	b6/aFj2D3BXgnDwo=; b=s4C7il24PAanfEhlDFgROxk8Hbm5da4D9KUD9zN63Mm
	w+Q2Lgx1xO/h2vddF9HrTkxMrop2G8DeS6LNemaU7xJbjZaDI6jNE7kFlTcoDG3V
	zRAUiP7UI3cdvKwefDp3ARDApek/HyIdm3vvPTxu4WQ9VStZ/uabai0g2YU3f2UE
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=kNv2ej
	/zqNXDKOPS5t00Vv7ANnbb6/aFj2D3BXgnDwo=; b=TdfPsk2NaqPwnbep/6hWiX
	NHxsfrNNtUJRDyWkIy9VFeJvsfsjVuDJkJWFHiU01XohcMKm3+XH6Ifalgkqaziv
	JDDMFDYYT2Y5+RpgWWyXd2ZoIPGRwIsOdI2yjjNbqxqvON0uoptcw2UJAXFF4rc5
	gnMlemgPZlliyr5+0u0ZLFiTLYZzquoFqWrMUug/RxsP94uxrMG3nkNRn90oVbmn
	TR/Ht5XOV8AFO+8hVsWGbPn0tPXD143R8Bx5Ctf/Dgp50LBkQLke22nfcuuCr11w
	c6Xqi4jsZmkZxiDDUYQ0cgq7vZpIYH1s4TLF2XvOTxoljSN0yJUyiy4q2RFjq05g
	==
X-ME-Sender: <xms:4jwAWR48punhppdFMkjcwxaYOualAG39C02PzRUrac6Bp2wDkNuGrg>
X-Sasl-enc: Se0/HMxzZw7XOEWa24UcbnkOWoRYLQKgCXwdP7MdiM1v 1493187810
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1B02B2469B;
	Wed, 26 Apr 2017 02:23:30 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v3 00/10] TCG optimizations for 2.10
Date: Wed, 26 Apr 2017 02:23:13 -0400
Message-Id: <1493187803-4510-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-TUID: PhNU+wiss6/X

This is the v3 of this series. v2 for context:
  https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04342.html

Changes from v2 -- all due to Richard's comments:

- Inlined tb_from_jmp_cache into the TCG helper; now that this helper
  is common there is no point in having a separate function for this.

- Compile-tested for all targets.

- Dropped the TCG alignment patches for now.

- Added reviewed-by tags.

- Removed stray goto_tb from tcg_dump_ops. (That was a leftover
  that should have been removed long ago.)

- merged helper_lookup_tb_ptr and goto_ptr into gen_lookup_and_goto_ptr.
  This makes the calling code simpler and also prunes out the lookup
  when goto_ptr isn't implemented by the backend.

- tcg/i386: add the "pre-epilogue" instruction that sets eax to 0,
  instead of setting eax to 0 before every goto_ptr.

- return "r" instead of "ri" for goto_ptr's op def. (*ouch!*)

- target/arm: extend to tl before calling the lookup_and_goto_ptr
  helper, thereby fixing aarch64-* target compilation.

Also re-ran all measurements, and dropped the noinline measurements
since now there's only a single (inlined) caller.
You can inspect/fetch the changes at:
  https://github.com/cota/qemu/tree/tcg-opt-v3

Thanks,

		Emilio
