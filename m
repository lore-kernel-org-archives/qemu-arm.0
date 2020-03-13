Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501072lfc;
        Fri, 13 Mar 2020 11:37:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvm8gmseURMHNhgcbJi51M3SDB1Ds+7MG2t+ags6XcA5rIEFpmwK2jgkt1NgxPjx+jdJQVn
X-Received: by 2002:a50:c8c2:: with SMTP id k2mr14904610edh.149.1584124630696;
        Fri, 13 Mar 2020 11:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124630; cv=none;
        d=google.com; s=arc-20160816;
        b=0h8IcUsNmOEZBbiqsrKq33X1KvsIvOdkQedju8EOn57ZL0o/VZ7FU5OxIdt5/6XLzy
         4oNRXejOn8YlHOGHTS29tldfZnqbv3UDj30y38xHHCAAkV6ZmA0vxfsypaQI123mgHBH
         ezxz8N9xrHSKqihRaJRN5d3m8xLsDflmVYsEMl7FwYknyuZaw4vgA8nrZ2oQOijPJfW3
         ohJAW9H4xCaCaz1L9nz2UQ5mBZ+bvO0sxIrEWkUDawagoMHSQianS4Xhjkwsw07KOguR
         EmVJZWLv8G3U2XJVF1fgHHnSekNCeQ4JRH/NN0iAW1sTwBu7tI2Pw84GA4oPzu5tAEE4
         wjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QzUdM1ZagK75BIGV+iiLIHXu9NBWzrOD4R++sxCHDoI=;
        b=v0h6AskVzZrlS58B2/z1NoqAnXl2MYw6mwdUmBLk2UQz7d9n47SGclnVFrffLb74w2
         uXeUWHya7fsrNvwJM1N/av4oFsbV1K3dGjRiMnPflcIkXWUdLiz3IDj9Zuu34gvkXp6X
         UYbOZ98gM9D0puHPmIaOLmdUbL2EzX5AByCL56HdInPMHWSIo87+yeuNx7FMtzaU8KTq
         BsQiyzxArVSjlAcj14OngVWtqndPpCH9DUNblmffCzFiFuw59pHiCowFxtYSD0gvPNfA
         CPw1ISjwyYhqXJtpWEkELV2fWxdedlLNar2/6PDcgJtcGenSkL6pW5OzU8mT+V8g8fzq
         RMFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a1ctCp12;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id z97si7020380ede.538.2020.03.13.11.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a1ctCp12;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzUdM1ZagK75BIGV+iiLIHXu9NBWzrOD4R++sxCHDoI=;
	b=a1ctCp124O9hJqJJ8pgJgQiCBuXhNXYkVltnflY4kyudFl5yOgQ7sk711H2R0IpKWzkza/
	MsZhzz/Vt1T7yrl1/ikKJ9jHW46Uv1ituvYlTgpNcLYOWaoMOEXHld1a9RasmUegaD76is
	F55uCaUKvqO7ryW4JLskDQ9KWLzFLzk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Sree1SX2NE-HEJOdJfrXfg-1; Fri, 13 Mar 2020 14:37:08 -0400
X-MC-Unique: Sree1SX2NE-HEJOdJfrXfg-1
Received: by mail-wm1-f70.google.com with SMTP id a23so3783370wmm.8
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=intvWc0QjhhlSzR1IDRa0EVk0LsfQ2/cVL2atlURA2k=;
        b=SZEa4bPJT+ik1hkZIUyPNtoT8mQDynNY2FD8H1vTofaFGsF/O4/jp38aAwJR1BEJfH
         x1cPH68V1GV6QTZ1++rifY/UPY670cWOT86wJuHPppoEh3QAw20WDNgRbcftJ8PKKbsT
         wgsS3M0qBS3GSq1HWbcJEd6hZLq7ciNCtcnsT9Y73ojGdaIIdcXSX2wAATmr9lz7VP7i
         BT3fstk7DolgmSGRULYWHvOyFXPM81GYq5VLQQ7/XfHUajakxyIbLljT7F/NOsg2+evg
         f1yRaKt2DASvkL8AqsT1z9w30iMNtdBumySF+lDfmqJUksTOxzGbjBTmhbIu5lagbQ/f
         9ZGQ==
X-Gm-Message-State: ANhLgQ3DpLzLCJl4+XACWX3ufiq85XOU0zBnR8i7lhOlGa8hcVOdD1BG
	m60nLY2/Xpf2iSLxJUtSttLzi7GAcCTksOms/8E2+AUbLaXd1LHQVHhd4PmNNJiOfGD8hOTsR0+
	zG/deXF1ECc+I9n8t
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr7730319wmh.65.1584124626687;
        Fri, 13 Mar 2020 11:37:06 -0700 (PDT)
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr7730297wmh.65.1584124626502;
        Fri, 13 Mar 2020 11:37:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id 62sm27365177wri.30.2020.03.13.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 02/14] configure: Avoid building TCG when not needed
Date: Fri, 13 Mar 2020 19:36:40 +0100
Message-Id: <20200313183652.10258-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: p2sSA+TiDhuR

Avoid building TCG when building only tools:

  ./configure --enable-tools --disable-system --disable-user

This saves us from running the soft-float tests enabled since
commit 76170102508.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index eb49bb6680..c2ffcb0431 100755
--- a/configure
+++ b/configure
@@ -1650,6 +1650,10 @@ if [ "$ARCH" =3D "unknown" ]; then
   linux_user=3D"no"
 fi
=20
+if [ "$bsd_user" =3D "no" -a "$linux_user" =3D "no" -a "$softmmu" =3D "no"=
 ] ; then
+  tcg=3D"no"
+fi
+
 default_target_list=3D""
=20
 mak_wilds=3D""
--=20
2.21.1
