Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp582304nji;
        Thu, 12 Sep 2024 09:12:15 -0700 (PDT)
X-Received: by 2002:a05:6870:9387:b0:270:129f:8e65 with SMTP id 586e51a60fabf-27c3f646991mr2382149fac.34.1726157535553;
        Thu, 12 Sep 2024 09:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726157535; cv=none;
        d=google.com; s=arc-20160816;
        b=XsyvSZEdAx3vtBOm+v/9HRt9oM3/tWh/PqJt7H8oY/8Ubtvnlu7uVXvbhD9dU0Q18V
         DeHZMLj+jw/ZGxqVyQzrgBoKdgUmSiZQ+KFHIe3yCdobQrwsYs1UnKLDC/lSfmMYwhkj
         VLE/R0DoUVVQWI+dnBcrYqCG26H8xIE+cgT+xqBU4/89OjKREvSbfuq2wreTba8RqfDH
         RCZmACdn7lp17tYPmI2mX75me886m/K92piHpIfcRC51CRrx6w9X0TQI5IEuRGMHuMPe
         WtUoN9HlbNri26oVoRleTLB8KKdirpyTYeZkJcgAcEfiyL08DsBaoXpgrPcc/1cVJqoX
         rKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HWN+Oy9HOzHEP1zqC69VZ8fDvc5xR6kboU5Mz4xPMnU=;
        fh=ujiE8HSy6YTG7a3Z7CGLGec891YtQfFM1W/0TkY2zUo=;
        b=G4qgrRR5paplcHmdr+XEqM30TSfBARlEjmcAJpUT2sPZXSCRAuiEF1vfPAWpqom513
         fcEr+srviIggnok+jKECbXTrnJKkMbPmNy13TP6oOleSL34QBupjjlfFl/TtIQkD8OD0
         A7oIGx6+72hTxUlmFFpRD+GCqAHlqOEQO0Blx5gsAScJekz+GQb1rIhsKP8fuLfx1kJM
         /30Eccx5J2huBpnA1Hh3HuGpHlzh3z28KC2vG+2ARIWcHCvJucHaFJ8Dj5GtaXsd36Cw
         QMohvtcgMD9oAdjbsO1Icy9QBAYoB93zVlrErXuRG5vpoLVuglq2Hi/fl2xIGBcxNI8A
         yjTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKbdK371;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d8234585b9sor4448702a12.1.2024.09.12.09.12.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 09:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKbdK371;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726157535; x=1726762335; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWN+Oy9HOzHEP1zqC69VZ8fDvc5xR6kboU5Mz4xPMnU=;
        b=cKbdK371lOetMGgfmYVpCZkPrlvYA1YB4XQSytTcNxOxwxrVtLCa9xqZMcDkQg7p9/
         NGrJRSD/NIGr2F0/oAOcwg0d+6KWeKn6Fc1ztoqVYxinGFKANhQ+li8LIOzwpzDI1pDX
         hcVuexcRNiK0bpCB/geSf2Sas4nC8f3+jL3mkirvmvz32396vjcm7e/YEYjAZI7ONSm6
         /QLHWgoimj/hQ4PzHEEvLPmZ2WulLtHymcTku8+EffXt1jUElodVcmdXCzvmnqX4j+n3
         ptJjUGW8iR46yKqSB4oJmcJP3QM1HqPLpu1NSFWmUetJ9SKJ+/0/Y6sTdXW4pp7nbyCm
         4f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157535; x=1726762335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWN+Oy9HOzHEP1zqC69VZ8fDvc5xR6kboU5Mz4xPMnU=;
        b=D7wlaGY28uuEzO5kbAuomNBBFQE2oGQucdVGyPJ7QU0lePdeS4VLvQPMzpzPAFQmGn
         hNJhMJizZhj2rhLnjunFihO+Iyyf9sHONQmQc+RI5s0nZE9YO4F1l79RvTRd2MBf0LKf
         K8Kp5M+eWdRGyGleHPnePVx1AuhiBolEjkrR0B9TPUiK6wbuarfI9bOquKu9b/x1AYeC
         FmiSOwaolR30AQSGJx0k3pELzycS0Y0kf9fC5QOOMyQYA2eYX10c1Cu2mHeF2wx+Ievo
         raqzCT80/ZCrgwdT60Rqph5SOhgGmrJsi+it6XkU+FRgwfo6QYrGzxAVic4t4jCtswKO
         dZEg==
X-Gm-Message-State: AOJu0Yw/dLEqMfj/w1QrYxy3Ec/gmFLoIaMAk4Q3mTcm5kkH6JyuVycU
	M2GPLa224HL3p/oE+1hGH9xalArSP0kzTcvzjRmDa0+2ua/5fGI66TuuW4hbApJq3A==
X-Google-Smtp-Source: AGHT+IEudqjJEaJGfdkYpDawDooI9CPu9lOGv3V8EFCc9McG20NJHsadE1XKePiqdhT+Fnpsv3OOxg==
X-Received: by 2002:a17:90b:4c41:b0:2c9:3370:56e3 with SMTP id 98e67ed59e1d1-2dba008304amr3540812a91.34.1726157534900;
        Thu, 12 Sep 2024 09:12:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db0419aab4sm10868139a91.15.2024.09.12.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:12:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-s390x@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Eduardo Habkost <eduardo@habkost.net>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Rob Herring <robh@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Jesper Devantier <foss@defmacro.it>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Fam Zheng <fam@euphon.net>,
	Klaus Jensen <its@irrelevant.dk>,
	Keith Busch <kbusch@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	WANG Xuerui <git@xen0n.name>,
	Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 48/48] scripts/checkpatch.pl: emit error when using assert(false)
Date: Thu, 12 Sep 2024 09:11:50 -0700
Message-Id: <20240912161150.483515-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
References: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yWtf4cgzVWSo

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 65b6f46f905..fa9c12230eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3102,6 +3102,9 @@ sub process {
 		if ($line =~ /\b(g_)?assert\(0\)/) {
 			ERROR("use g_assert_not_reached() instead of assert(0)\n" . $herecurr);
 		}
+		if ($line =~ /\b(g_)?assert\(false\)/) {
+			ERROR("use g_assert_not_reached() instead of assert(false)\n" . $herecurr);
+		}
 		if ($line =~ /\bstrerrorname_np\(/) {
 			ERROR("use strerror() instead of strerrorname_np()\n" . $herecurr);
 		}
-- 
2.39.2
