Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444946njb;
        Tue, 10 Sep 2024 15:18:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpS71UoicXDwSGIoWeIATybBsob/+ZUn/wfNwEL9IKZEOUmZnQ6lYOnCJsn14UsZAoT/bbkQHwjFS9nA==@linaro.org
X-Received: by 2002:a05:6a00:1803:b0:717:97e3:6841 with SMTP id d2e1a72fcca58-71916ede81amr1353389b3a.24.1726006691621;
        Tue, 10 Sep 2024 15:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006691; cv=none;
        d=google.com; s=arc-20160816;
        b=A6OtQD6HHPaGrbH87014s6/HPD/uxN1WOwUMnY2L7vdAG6c5ZKCpGG0IH/N04vzK+r
         V+WbV3fGZMZxHDeXR+520mjGQD+7ZJy9SStaLOvPA5qBtfhpBaN8Og4j48DKgdUdmbkE
         xOhhylHMNJKxgyufdtUolXhC/6edsIpkFpKVSw4elCWev4GbDoYSaeCa3p6hbM+klCYI
         D3P0Pvr+D2j+cChZs/+jKflolpkSm4tGW7PbUIk/AXPmsCcJEmhE1PHuAOUTZTnD+AMc
         JFtF7+zbU4bhCwjfbRk3nCs8cGaIxkJdX+ECqFDGLuJaR+EbY7MCnacW99GxPRBET6CK
         FHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nwKevNIRKkN+EDjbfQlFt24U9FBu+BfVdKedtfXUqZs=;
        fh=SgrewxkGaYMrAusurbUQpzlwOqykAJohzhwmeRar6eA=;
        b=itMnnDbvPvt83Vi9UbKfws4T6jdXPPHjj7mH50olElVv1dcsHQf2XmMwwn+cj8eawo
         CZLIioCeDf9qvdmSYKq3DVNL5eguJdtXfTfLoMq2jo0f4Zmi76fwB1OBTINStBB3Q5md
         4acUfaQZyZLZe9gPBC0GQmN6Ee+L3gnL+7L2iH6kNzQC0DVhrhFAjqa+/o3xaFwNO/9M
         tzUSRr1UdMrEz4mjIihBoKmHCNiVmvKm86+WoQvfR9PXXvFhEiX5vOLSiktc1HppX4B0
         tCntMqOuQCJ2F0fx623zvUkiQtkXcqOUb+JBHPAOX1ZxsRRbxwXF+gjzVs0Ij5L1mgc/
         tZ6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F87xi4A4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58aa24fsor5858320b3a.2.2024.09.10.15.18.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F87xi4A4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006691; x=1726611491; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwKevNIRKkN+EDjbfQlFt24U9FBu+BfVdKedtfXUqZs=;
        b=F87xi4A4LHecAgA6nS5hpTOpHjVefPei5YIhGJXm/ESMzqEnlgcWSZsU/UCL1P23oo
         +Z560uf8MdAhr+RkozKIY8E807nyvldWikJ0g3jHxtkIL3gMOnM/vaWGgJyIEvNOCCki
         WyqkbbNHfLl5u9YkRRw+5nHa5WIXyKegwFtEuWN9TA3YyDUT5wSCPqQt0WvrlEqK7rVE
         mooiJGgTZ60v2BtmECut+lbmvay6pyGz4hu35NbwBie/Ez1jg5+s+5itsNpbHvRaeSoi
         7sdahrWpYGpkiLdu0wL5zz4I8R2UAv3pM3k9AYQZOBMv0empjh3Cj2GIsXCvV5prmjoz
         jRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006691; x=1726611491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwKevNIRKkN+EDjbfQlFt24U9FBu+BfVdKedtfXUqZs=;
        b=Mv3izImge8pJbzXtJ3HJryvTcG1WTCD5mF58Fj0ab2bihcbUT9DEofszMYK3XhzPoc
         iioVIU/SJNaxrrzP+JOHDhBAPj2a0Sa9DELhy/V/fcb5xNYdcKxXPdohwacD9ISOSaLC
         68Hdt8+IggDdN7jFyWmcKviMrQqYGwsWbitDVpaJ7BmkuDMt0RtNskDJ38hHPznlUlKU
         aZjSuB+SqrcDqkD5BFdkzyCfVUVuuunZeWD2d9Bnhu431lPq1grLP0xQ/8rbluwmWasn
         xjm4snwNVEQzWi1UD3iCkMsCKCKPmmmJhqWB5eCid4B1mJ7HCsp2fTFoQs7XHhXvKbdQ
         jOog==
X-Forwarded-Encrypted: i=1; AJvYcCUwrS6jGNQfVPp2xI2SkdozSlnTpkytSn72ov7eJOe6tRTbw9brQVmGfdz3pBIHs2GLRJPktFWQV45VFw==@linaro.org
X-Gm-Message-State: AOJu0Yw9D/urmgTY/TiY+bKucvNEN9oMnc4/l0RFQsa77l4g1E5NvRBC
	F3CcArUAOS5HICulqb20ywEXs4pnWVRQ78pVtxvKq42ZvT2mJiWswkP7Zq5wjpnf2A==
X-Google-Smtp-Source: AGHT+IH1SlHsJsphQAKUCS+TONfXaMdTKjfpItrNVqpZABGJSlkB8aGqx2pcbEZTF3hMcOrMflu/7g==
X-Received: by 2002:a05:6a00:2ea5:b0:714:25ee:df58 with SMTP id d2e1a72fcca58-71916e9b6ebmr1238405b3a.18.1726006690994;
        Tue, 10 Sep 2024 15:18:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:18:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 38/39] tcg/loongarch64: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:05 -0700
Message-Id: <20240910221606.1817478-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A/NFY0YJU9QO

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 5b7ed5c176b..973601aec36 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -650,7 +650,6 @@ static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         g_assert_not_reached();
-        break;
     }
 
     return ret | flags;
-- 
2.39.2
