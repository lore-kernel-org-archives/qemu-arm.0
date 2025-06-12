Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2603989njc;
        Thu, 12 Jun 2025 14:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx6A+M113zwNvFiZUs0uF0PoJtXC856e8uVKqdE0SK1qJfTxAMcS+eKVlUfKBPNsKjY6Sy2PECobfhSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGO7QHR5RuyOx3WnzYkzfFmSoF7PPO67OQ6FTnzDscDFtLwaWvpfh33e2LpS01G9gh+csM/
X-Received: by 2002:a05:6000:26cc:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a56a2bb7bcmr18287f8f.3.1749762100180;
        Thu, 12 Jun 2025 14:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749762100; cv=none;
        d=google.com; s=arc-20240605;
        b=iY70W+Jkin8YdPftANJn7e5qxSmjzKD5Ds8G298c4pensDJzw9AJnot962gCDCXxha
         t7Wp79IdCnn9H2+fyMEHEWPdvIaYrh9zEmMN+j3SfgR8Ank9MFiOCj1knzuTJrUv0Cip
         4lYlmfZtsk7M8U+0c24JEtne3WH4jx8BrHpVNUjT0/5CMswvbuoasBA4zYWWHNmS68MC
         mgb6uycOSuh73MTLQWaiT1bCXaiJaSG9QC9ZAj/89MxypG1UdC2/o5erhAnkNIrb3t9a
         I5b4KXyH+pAw89gBH8nzLXB/BaKiqK/b3I7dE77KVXTdULF54ehUDUoLVQJScCkGQoAd
         xUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aQL5AVZzjW1dNur0+zU036GgiAEpA8O2BMI4YkdQQVE=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=GQIKhgb4tDDT68CLynB6sung4Y6IERzlLcUBczeiTyeuT9JgnwBhSWMCCSGtm06/RM
         tCVA9KXrY/6Z6PHBN3kcy+PGsfTwkzsB/IA9IVJ/J943xoMc4B0KMon4/iRtG3iEaB5A
         fKDY2CQXwhn7cchWF5sIAnqJHxlDrXQV6nMG0WpbalZSCmoR8tf1UiMaPDer5v3PzufM
         WahCUZ5oHAlWSuSb8xkxwyAjIziQc4FD7Cb7x+4gjBMfP8sh3P6HVtoJm/9ASWaCSM/E
         0OsLe9GrM88nZnIbjg9Vo/rojdcb3GzHlXZWKqndW+7pSjLVmV3IdbizDZYeomSWWVe9
         x9Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGxLlkdS;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a568b7a9a3si204339f8f.615.2025.06.12.14.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 14:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGxLlkdS;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749762099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQL5AVZzjW1dNur0+zU036GgiAEpA8O2BMI4YkdQQVE=;
	b=fGxLlkdSsUquvRoBMWQYJYIOae8UfQVtSdy87ZBbrkg+JsVOFFQNZ5KACtQ9BRuv1ufn/g
	p16UxfoUkO8pJpPT35Xm3punSY8na/g2i3c+wYHDl5GWuWnf4b/AF+jDPzmttezC8gUrTE
	I7i/fdABY6kfDt6/7klwarKI9ikjrKQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-_XCafYYOO4yxsacCN5Jm_A-1; Thu,
 12 Jun 2025 17:01:35 -0400
X-MC-Unique: _XCafYYOO4yxsacCN5Jm_A-1
X-Mimecast-MFC-AGG-ID: _XCafYYOO4yxsacCN5Jm_A_1749762089
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E98F195608D;
	Thu, 12 Jun 2025 21:01:29 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B1FE11955F4A;
	Thu, 12 Jun 2025 21:00:58 +0000 (UTC)
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
Subject: [PATCH v2 11/12] scripts/codeconverter: remove unused code
Date: Thu, 12 Jun 2025 16:54:49 -0400
Message-ID: <20250612205451.1177751-12-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q6BKVZTp3iEikk_aT84Wik_Li0PVyNwn7W4vaGtsOqw_1749762089
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: Xu+uDIdJORuU

Remove (select) bits of unused code, as it is not typed correctly and
appears to not be in use. The quickest solution is to remove it
entirely.

'Match' is not defined, and neither is 'TypeInfoReference'. What these
bits of code were meant to do is unclear.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/codeconverter/codeconverter/patching.py      | 3 ---
 scripts/codeconverter/codeconverter/qom_type_info.py | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/scripts/codeconverter/codeconverter/patching.py b/scripts/codeconverter/codeconverter/patching.py
index 7c3135a3e27..0165085caed 100644
--- a/scripts/codeconverter/codeconverter/patching.py
+++ b/scripts/codeconverter/codeconverter/patching.py
@@ -418,9 +418,6 @@ def show_diff(self) -> None:
             f.flush()
             subprocess.call(['diff', '-u', self.filename, f.name])
 
-    def ref(self):
-        return TypeInfoReference
-
 class FileList(RegexpScanner):
     def __init__(self):
         super().__init__()
diff --git a/scripts/codeconverter/codeconverter/qom_type_info.py b/scripts/codeconverter/codeconverter/qom_type_info.py
index d4dd6267b76..4ecdd728890 100644
--- a/scripts/codeconverter/codeconverter/qom_type_info.py
+++ b/scripts/codeconverter/codeconverter/qom_type_info.py
@@ -29,10 +29,6 @@
 
 ParsedArray = List[str]
 ParsedInitializerValue = Union[str, ParsedArray]
-class InitializerValue(NamedTuple):
-    raw: str
-    parsed: Optional[ParsedInitializerValue]
-    match: Optional[Match]
 
 class ArrayItem(FileMatch):
     regexp = RE_ARRAY_ITEM
-- 
2.48.1
