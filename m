Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178725njj;
        Sun, 4 May 2025 18:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQlmoYzTVjE/u6aYAFTyBsOK8fNGnF5MUrbX4HIPwCVeHT0V+AHFWszpvsqj81ZS75pjoj1OfH0SQP4Q==@linaro.org
X-Received: by 2002:a17:903:1ac3:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-22e1ea636e3mr82239985ad.32.1746409953869;
        Sun, 04 May 2025 18:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409953; cv=none;
        d=google.com; s=arc-20240605;
        b=kS96vRLP4vL4ip6IzIL4max3v+RKOHqT8tnYiovykFS51KnPKVI247qgfJPiwTQepA
         GXuwEGhtsQch0QDv6wyMbQXJJJzmFmL7Qf4ZGFkJRckl7fcUrGzO1KAKHjgatC9+PwYy
         NRDIOmmPuey306WzoqLgOrolW4T974z2CTb1ShQ7HeyyIAjBQQCj0K1c91HPt5kB8muR
         1oXX5p9CWej0S7/jrvHUfRBBs2bGURAgHnOJZze37l7K9IWKBqIvEJO87HZf82mCCXmK
         SJgp2cT81T+GY7ey6prgZ0ckVLpJbaEr986EvFnAmw1fKNT3LjG/lvtg5YvFdy7HJept
         Tnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=1b8KhK2GJ0BcCpualeOWhubunDil30a41xG15GIGDFQ=;
        b=WyL+MaYv8tpr3m/SO3WMbQwjMhKuRUd6aulaG4qrpfIO/Sh0jvBPfBQO2fpEPi4VLa
         aXReaFSVEU02eUCv1DCnRH6EwSBBA1TRuHqbEx7yhvBE0odbVFftDhbsWWzJHyNtmwFi
         j+UMILizUz56lW7FNLtHzL0es6irWLJ88c51lQW1d1ep2Qm8T6gj7Ml4zwjFcwUtiYsK
         C3JxEzpdI6mOuSJjhC7fnYRqxdXqpgjUOaRDit9WXDhPQXnccxaGIQVLu0S/giSQ4S6X
         fGUvaflRGSmmHA/QHjMePE8g69sT2luWXGWR48ID+BaYDhnX3uFQ1txFOn5nTcz3TRQn
         lbJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wf/4iBrq";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7c109csor3758461b3a.5.2025.05.04.18.52.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wf/4iBrq";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409953; x=1747014753; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=Wf/4iBrqxLW1ndblGuCUIf1SHNFb6213mrC5aHQexsumpqMZfUalCAU9VK/HzbFwzt
         UGD+IErHbGRZF8mhbw/99P1ns9XWRSyK2vf0j3Nc5DnLKcXlJuEcTH9ok5NKK5mbmtkc
         sBrxPi4ww8WZpk6+O+i5Z7haYPiPdaLwM39bdpJzdMb+w6Z4I8udgMvktedQ9vlEqzsy
         CQN94BeT9RxLD7Cs7lwLikfyxxfKIMtOL1oWMTqkkZA15w3qr1g8YPeMGeHckfpnWwU0
         QZfCjSwoPwh/QH+i7pcsJGSgTzPuAJeIWQ7LdNDM3Nnf8dw58j2z4sWDb9wNz6U5yL4h
         /5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409953; x=1747014753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=hEZKNBq2HOZUFFVDFUHA2F/dAeGnsd2wdvnMBzOYfzdDsIJBTf3wul09rdfvlbDxIK
         Eyd0CdW0jRj4zMEbu7lkXVynkk3rN2CWRPhWopGJQ+mYcBJhZntFb1gclb0bw/JDqbF8
         x+mNVTb9bgMmz9qh1UsHGp5jWM95G1hlpxu7R2QukVsHHfUVMnvL3l+2CJf8rt9l2okr
         90+8xsuC++1lAe2qSspD9fIpQpLuyKBODnnCc74i40lZCIsHbO/+g35fv9/0bG9+6LqK
         fTa5HtKsHr9Z1mJ7V1qHmh5urEVsG9966gfJ/7GAwo4qq3pkhiCoIsHOOfVNvQhjo+y2
         uxmA==
X-Forwarded-Encrypted: i=1; AJvYcCVU7xFMcK15mVZb0veqyQHR0Vmtjm3OGYPN3WiLB+xu1n2vl0826AkYwW0ZjAnKVcJlnB0XnL6HDhfIRA==@linaro.org
X-Gm-Message-State: AOJu0YzIC2e7a3xTcwL004KVkuTGVgLe1QNHLcEarzgspxCvMVxT/ocs
	L82O8cZOtpO0tDDj/Ml0xwmfeyAqCyuP5dngdmyW11kn8Vw6uTMMWU+YroE67uiSuA==
X-Gm-Gg: ASbGnctexkH407f3Bq3A0RbTNsuISQ+qs9F8zkyugYeyt0R9LnLdVcEiNwuoEKPNWS+
	JTJXwQPkJziHwcyiTcVwvqQ7zZTPngaXd+MrAppd3n/lHrTiuykp0x7DVOweHhBjPgZPiLaIKaI
	1BGElnrj3RW13n6ynKKNdeJZgWgOB7LPADgCpzDJNy4v6dMD+Y8P2suknOvQ7Zp7ZqRKG0UE2Bn
	HOeLJgQKtvESUc52044RzEiNJgKix2YQ3xSXdTEtLeTGzv7N6IhvVzGTdTEKuO6perOCStj9wlk
	HsoCo5SHAUQDkU6GfrtS8FSd7oa5C/Xc0nXMmpLd
X-Google-Smtp-Source: AGHT+IFwncbL/3OpuXVRzOUuTtFA0UcYGtHTDKFtJ5+PikCCokHOgPA7NXr+7+rU55xaMgEVDb7NZQ==
X-Received: by 2002:a05:6a20:d049:b0:204:4573:d855 with SMTP id adf61e73a8af0-20e9610a742mr7965931637.9.1746409953485;
        Sun, 04 May 2025 18:52:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 06/48] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Sun,  4 May 2025 18:51:41 -0700
Message-ID: <20250505015223.3895275-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qTHaHm7pPkOm

Needed in target/arm/cpu.c once kvm is possible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..e34d3f5e6b4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
