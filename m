Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5579097lfg;
        Wed, 3 Mar 2021 10:25:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyAIGfxbjcMLtaMFPp5EHnxu2OpPmxWfrpeZv4pAQH4bFaZaNz+LcH5iybj8QmSxPrliQx
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr396955ioh.210.1614795924267;
        Wed, 03 Mar 2021 10:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614795924; cv=none;
        d=google.com; s=arc-20160816;
        b=wMiZdIQcTZj0wrXpemK4k6E/fsy//l60ORewU3XLQpVLs6icW+c7ylxjLpNhJkFXw3
         pNF9Y8aeIeDJS6QTpMROmB+zRvhGHw7jip2rAV/CP+3ugYgLoGSIRJObPr0t7DsHvorC
         Ncx0zzuYYlhs84bEq4fnlMrSAWtjZXx6EFjdPkrurmJXaXa0Ze9479D5DsL86+pSSJB6
         JcBbXQA2ND0qbfv3SzSzksA3J5geG2F7yfk/9xNUu2pPj+QVYpWvEQDMpEwgKuUrBP5/
         zphKvdVM6bgc9/DSkCb9QyCLsA8AOwr7bLCIAeO+1RKDmtn707c69hFLpvuJDLMh5JGA
         L/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bQjkhbMoK/p110+ezCXx6XyhC9yOCxnNoBGV8HeX/9Y=;
        b=FpJrCP21Zy+8jY2jaSrPk/hM1O4H2+TDwic42/J/tIJSbn9PTU+sm6wBGXthvJ/EHb
         uIAF2IwvgJnAqxguoQ5HkwZTyxzebU3S2lJZGFLNB7WvzCLZkiD4rVTM2rDAECkhN8X/
         XkfNcOZfpHDvsRoVG2gw+bctgK3iivTYPuYkfFwEaClxeC2fSi+4d9WRi+55Hfo1r5ge
         mU1rcJLfkYulD4j2i5X2nbJObESbhtkK30TBjCZbwCLP2rCvRjdu313ZzhPfllAyFdMp
         Zrarg6TmSUlaeMfqqTATzOyRBPMbGZlZgWFJ177Awj631aLtSaja44ZqANqnlSY0giOA
         GWow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XfuyQ/eS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si5204987jam.7.2021.03.03.10.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XfuyQ/eS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWBX-0000XO-Jq
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8n-0004Xf-TJ
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8m-0000NL-6j
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQjkhbMoK/p110+ezCXx6XyhC9yOCxnNoBGV8HeX/9Y=;
 b=XfuyQ/eSiyjsZzs4sO9LD79H03DIirzBAoSBBFGdSTrM+83xPbVtRWlo0I4JRVSqW0hoQG
 sktOPxNQqPq1h/1Z5gfw+fB7rXzJMGW7SbDh3vh/vSccFL2TgKQf3vKPJBiLau7NOpa36E
 xPBE/BIFCzdJqVLveOiQWSgKX6HARcQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-Ok-YZFJbOgCaHJlbtPsylw-1; Wed, 03 Mar 2021 13:22:29 -0500
X-MC-Unique: Ok-YZFJbOgCaHJlbtPsylw-1
Received: by mail-wr1-f71.google.com with SMTP id m9so7425819wrx.6
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQjkhbMoK/p110+ezCXx6XyhC9yOCxnNoBGV8HeX/9Y=;
 b=U9k0V4A5areI+B30Mg9Y9YrgNQhYB4QAncKZEfu7qHgryBlAQUenZh+TP5OjiKVMyb
 zoyIh98uYP3h0Ft7EhlxnFI/WuEF9cDN4UCJDbgNHtXhCimnOz2X0M5cKy95AobmLP0J
 pwYQv081NMojgaSdGLOjbtcFQgJ24vuo5DkfFbZcMW3LtEX4nW+R0nK6HDnAF+0Hcddf
 Avq0YAc07xpTznEQ6f5crT5q7GYLeer5Orq9yYRmEixxDDNvItHwpNNZdfWctQi3s5Vi
 VQQzkXRL+hdQFEM+5Wk/OEOVOQK5TRCygXwSBMSX/Bh5QdkwnonnB+Sci5iB6fPZJmT0
 +EJQ==
X-Gm-Message-State: AOAM5332DyeXs2I/5W+RvK3qsylxRClgUfi6TVyZ5u6cuFA4OSGfn0Gh
 wjdCm6P1hecAHbDiKD1eogn5P+MlSdYnHSZO0NzotYlh94T+JwZz3tjZE+hEFO/JuO+XrTekASr
 aCTTBSdnauJcj
X-Received: by 2002:adf:a219:: with SMTP id p25mr28636290wra.400.1614795747885; 
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
X-Received: by 2002:adf:a219:: with SMTP id p25mr28636276wra.400.1614795747724; 
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm33044035wrr.58.2021.03.03.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] target/i386/hvf: Use boolean value for vcpu_dirty
Date: Wed,  3 Mar 2021 19:22:01 +0100
Message-Id: <20210303182219.1631042-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BramsNLCXBlG

CPUState::vcpu_dirty is of type 'bool', not 'integer'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 15f14ac69e7..3c5c9c8197e 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -533,7 +533,7 @@ int hvf_init_vcpu(CPUState *cpu)
     }
 
     r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = 1;
+    cpu->vcpu_dirty = true;
     assert_hvf_ok(r);
 
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
-- 
2.26.2

