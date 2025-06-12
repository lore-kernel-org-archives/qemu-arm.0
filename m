Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2601464njc;
        Thu, 12 Jun 2025 13:56:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCTjSn7y2eUWj8eJ0vSMkh/B8KPsQtC40bwJsKEJTO8AwdtDi/FRX2RvI0tg/ZKSAjZUblHUwGF25oLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGKI2YtXbsIwjrKa1dKDhuI6E8F7IHN9GXDAze78qMHousqRt2EZIJIJWT9fberIlElLbuQ
X-Received: by 2002:a05:622a:2b05:b0:494:acc8:b4ce with SMTP id d75a77b69052e-4a72fe59a80mr13541601cf.11.1749761812749;
        Thu, 12 Jun 2025 13:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749761812; cv=none;
        d=google.com; s=arc-20240605;
        b=bWiZuQlcUpXmD/FYuBr1fvc0UehFaw3R0a+dAVec+lpjKj31BD/CZ5dqwavyYtVsdY
         FbdP4Ck53yMS7oUKHIPb3mufNB5RQdJuclLh/0VRQw6ZGjY6GTRVNB2jhcZP2PQODtbB
         TDSh6ZIBHY3TMYV/O7faMDY9GMlI2NC9wKkxzE7sRhA3yXEh/C00RkpBa9y4qrqpagfF
         yUMVylpveSFV1kq9BRFuMjNntWIqKtNf7KHNtC+8H4r9bsU+aBmn9PVZEzcof9bhhhzu
         qwqHcP2gBF//yBaaWCy+FUvHV2Zb23JGy9Ka4q738pJsK7Sn+90mmt4eYU+si0pBGFRe
         v8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JPQI2hgsJD7vC72UdLStao/hkDc48A/BlwOX5s90trs=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=BrgMnM5RPRGsQhxdanwlgLktJeOVS0MzXBWvcy1j6Vhla/XePhj1xcfyUSPPcqGy/m
         ZO4yW2KlVgfQwHNprPtPX1FbHtcwUn6WUB9BdL2epZVo7S1su1sW9HmW+tGw1tv1bSU6
         8KrimXexwmXGk+9fBO3TiQz+QOmNPqbLMvXwnydnTYU0YL08ZwNZytrUf22RwM7g/xFC
         Uct0AlquxQ/ZDz91fh6iN+as0cvS6420H/5DkjpP3EXxBjjuzdYM4JF5PUXP4/TFUIav
         4C9X99pdw2WvyRnFWl77eTu2nHkr/qm8MMXjjSMjViTHgQ/LTEUcaLf9b0DBJnTkusIW
         +TNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WVQwTb5K;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a54b036si14349921cf.648.2025.06.12.13.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WVQwTb5K;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749761812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JPQI2hgsJD7vC72UdLStao/hkDc48A/BlwOX5s90trs=;
	b=WVQwTb5KpUO02o/bWmdoLbi0YYIncufEtfegeUa65uHDDn7iQM5r16+90F1xfa5Ojr7diH
	g5+sokNUU4zFvEM1S2k6/Ah48Wk21lcM5rWExtAMRGqHLaCwqE1yg/MTJjTzBB9eYjmCu0
	xlXYPBhzymYaLID8dXW1qHL7iVYtTzk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-F0NwLUNoN1qxL7eHqTmqiQ-1; Thu,
 12 Jun 2025 16:56:49 -0400
X-MC-Unique: F0NwLUNoN1qxL7eHqTmqiQ-1
X-Mimecast-MFC-AGG-ID: F0NwLUNoN1qxL7eHqTmqiQ_1749761804
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DC1D1956089;
	Thu, 12 Jun 2025 20:56:42 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90D1C1956050;
	Thu, 12 Jun 2025 20:56:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
	Yi Liu <yi.l.liu@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Fabiano Rosas <farosas@suse.de>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ed Maste <emaste@freebsd.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Eric Blake <eblake@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Troy Lee <leetroy@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Ani Sinha <anisinha@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	qemu-s390x@nongnu.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	qemu-block@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	Maksim Davydov <davydov-max@yandex-team.ru>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paul Durrant <paul@xen.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Hao Wu <wuhaotsh@google.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Thomas Huth <thuth@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-rust@nongnu.org,
	Bandan Das <bsd@redhat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Fam Zheng <fam@euphon.net>,
	Jia Liu <proljc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	Song Gao <gaosong@loongson.cn>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH v2 02/12] python: update pylint ignores
Date: Thu, 12 Jun 2025 16:54:40 -0400
Message-ID: <20250612205451.1177751-3-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S-aYttABpkt8ouJz1i7zOKXQFXr_JT63xjihPPUmEJQ_1749761804
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: zB/2V4o+Sh33

The next patch will synchronize the qemu.qmp library with the external,
standalone version. That synchronization will require an extra ignore
for pylint, so do that now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index d7f5dc7bafe..02cc076eaea 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -140,11 +140,12 @@ ignore_missing_imports = True
 # --disable=W".
 disable=consider-using-f-string,
         consider-using-with,
+        no-member,  # mypy also handles this better.
         too-many-arguments,
-        too-many-positional-arguments,
         too-many-function-args,  # mypy handles this with less false positives.
         too-many-instance-attributes,
-        no-member,  # mypy also handles this better.
+        too-many-positional-arguments,
+        unknown-option-value,
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.48.1
