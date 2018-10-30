Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440009wro;
        Tue, 30 Oct 2018 04:23:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c1dHDHoz+NuiDuPd5TyPy7wgk1JONMNbJ8iBUJMl3up53fr+g7xAAHtytxbcL3+J86wS1k
X-Received: by 2002:a5d:43ca:: with SMTP id v10-v6mr9304020wrr.244.1540898633445;
        Tue, 30 Oct 2018 04:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898633; cv=none;
        d=google.com; s=arc-20160816;
        b=B7bmxjlWq6Zuw9yQK4Yxg5liRrPN7VPSMshzTa7b+Fnf+iEacJ2aDqEzZEchefbTqg
         u9amkozo/kIhNVdPrhJAxzLlSZlYzzaPwPIOdT/YqAjTFM0Kl4bdPgeTwxA7wi8exd4+
         BiY5LU5+T5s1DzYUNidVSEiTNDOMU0B6dIhe6sgQb6SA4nT3EQ8zszhC9GVJSt/InISH
         dHGXNvCsB3KChz56W+22k2R/hM+xrENq46bb+oIhWqp8VEP9vR5LQPwU+B1wDyCvE/YL
         1h6N+Y3lq89RSMxULrO4LRRCZWh5ly+l1rO8qlCzfYnQ5oSpMxL3E4YX5JkotZc/EP5Z
         E/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=x72wGazpZPqiR4VPR3HYovlBNDCcYn9E9Ay7uvF1WNg=;
        b=ItBOPE4/HU0pBq2gVd5twjfVdQKy5pa26tYsx/h0a4kFVztnj5afmCepLwkGxxHfYk
         1FaTxxn0ZlQU1eErzBVa2A5tbnq26kHNVSuGQngNO5K5oRoy4QctJGIQAINBPK7brDkg
         hRfQwbExVm2oVD1LHhAPgf/PhWRRyPsR9jIukATxcRtZy5nLOhkl/2m7ACZ221LLaaWZ
         rYH9mS18mc0VGSJIWRag0Jp3F0pPcMJS6NO8lr9qB483drewS+4oKKRnIMss6mAUisjR
         Xk6+dhW39nNZaCnYY//UjCwNYuzpbnDk7bBBTd2qiOu3fdIW7f7qUH9kHvLAXVzMBdKb
         /zvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id f16-v6si12620045wmb.59.2018.10.30.04.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:23:53 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRmF-1g2srR2WfT-00Xprt; Tue, 30 Oct 2018 12:23:46 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRmF-1g2srR2WfT-00Xprt; Tue, 30 Oct 2018 12:23:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 01/20] configs/alpha: Remove unused CONFIG_PARALLEL_ISA switch
Date: Tue, 30 Oct 2018 12:23:18 +0100
Message-Id: <20181030112337.17973-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b/w7jnw+xQS1YeEBcE70ncEpRJovYtV1+sIVuHxfe9l0XSPc9x0
 /0PzbNLbMR/lw3sSIKlarCSchPH7YlnG/mRMr1hPKxLcydqlXQPa1p95OnGeEdYcOILxNWq
 CTK/WSJVwga/Kty+ja1LfXgStGt3ypPOt3JS6MxdtckiX9aaS9J3A5S46HJ+PBOYRW0vv7x
 32V8nd4SqU7x7HIgezJtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:TH/Q2sY14Bg=:yT7jHMpnaFZCZkw6rbfXIJ
 EcFF2Vca62jNEfwh5/UJtV2+b6ys6mKqLVT2ZwneVUWyTNBuT2/tkM3RX0lSmo5QxXoAMFnHN
 aMZMtwLhSgFOjs8Fc3XwbP3uDozsL0CyQFJL5y6jzni8uaz5kx1N3xyuLg6QPHYKA0DWRPVMM
 q1ktZqSpSh7f/QvdNzUc/2YRefp97Fit6Ds17sQ26sPxUM4XQ+JagO4IXEBRE3n//4l+yfacJ
 FIo6gC32TJDW7o26QkxsXvycNP7DQc373MwEslRGwBZ8xZ87n8ty0YE+6lAvZumMAuO7XD+17
 TGc++15N8oBfekxKk81ukhWYPDz28smKgfNd811oI4zaZhxCPbYprAB41gANMWjcGRm7LNPMp
 ntnxdJV24SshT9FNtazGTQS88IKf8VXkk/Yij8CnqyJ+7bye77plV7yJII+KgZulsnMui0sdt
 AckogIUghm5RKNI5Z7Rkqqn2u8NORlS4ABysCcO9U+5kfvMOck0Xs+x1c594mvX8I1s1PKdq4
 5grf0+bChZFBGxYdHYtn3gH+zIfW3H+HWZFproRs2Kwmx9+wdVzU1AlnKlYt01vgvUVJjHMoC
 ymmXaGN9jNWeLRqO3QQEcexiLcUmeft1SX/jrceMEx0/TSWCzTo7iJu/VGyrseWYnvcHMgltG
 6UOH5kgyAiG6mjC+NDnPK6hBeQxngXDGt2HvASy+wJw2DU8Mj5D13cnCzaGYfhuhuckwpRtcz
 OA8aDGBMuE4MmkL3
X-TUID: U6fpTNZb2WQy

From: Thomas Huth <thuth@redhat.com>

We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
is just a dead config option which can be removed.

Fixes: a4cb773928e047b137c6998209cf2eec857fac6b
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/alpha-softmmu.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
index eb58b40254..4d654eaa0b 100644
--- a/default-configs/alpha-softmmu.mak
+++ b/default-configs/alpha-softmmu.mak
@@ -8,7 +8,6 @@ CONFIG_I82374=y
 CONFIG_I8254=y
 CONFIG_I8257=y
 CONFIG_PARALLEL=y
-CONFIG_PARALLEL_ISA=y
 CONFIG_FDC=y
 CONFIG_PCKBD=y
 CONFIG_VGA_CIRRUS=y
-- 
2.17.2
