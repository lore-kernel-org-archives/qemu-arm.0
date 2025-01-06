Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp12000788njk;
        Mon, 6 Jan 2025 12:03:15 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXSylprGi4XDQlNnYiiWNjvLNTx08S0LPRiGkg/Wx8HO1v5waIU5Mx51csndPSLHD2qtcaNkR5ww4EOIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFeajk51oX9FMKv4pcS4pXgFGhanE1FmxeOQX3dDAKhPtMwG1nA8A5n5cnPvVsm1LIxfNPa
X-Received: by 2002:a05:690c:610f:b0:6ee:b754:bb11 with SMTP id 00721157ae682-6f3f820115bmr492164707b3.32.1736193795197;
        Mon, 06 Jan 2025 12:03:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736193795; cv=pass;
        d=google.com; s=arc-20240605;
        b=lzoM9SYj0OGswHzIc4dA0zIv8qrHRI38Wh8GslWH2n0+mzpY1a98ut003n7LzRY5i5
         2wMY4waLsGZ1dAnFacWOhTX7Hinh6czAbnHATnrKJt3uguyyCJX6oyBlMSxUfh9WUXJV
         eBOkTV8yWk0+T+kL5hJ8kpAj1WjLaRwMpEih0SwrfcIVjcoKekNz5ApqGylAhyOwQS0p
         LY+aJaP0+CtmWrjc+kW4uIqJKhsFsRfDjHGUPABmDsvZc0wHhUdEgvZ1uIru7rbhAIhH
         jbevwsMBLrJK4HZD7MDgIqtk3OrdL7TFsgP9iQkT2dWvfjeNxrmOXn8nftp/YBAOFXqd
         7MmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Gw/8miEe/PnaBFePSWTnOg3qI2ZvVUjrjdrVrAxgzBI=;
        fh=1NWIfSAqwCQpMs24RVzUpR5HThdFaTyDu0mZUyRHFr4=;
        b=YWE33Ev2qZQGfsSz7nflYh2ptVwWskT0xFFcAT7VH6WBIdYwXRA83UX6qhx+K6BriP
         2FZcOHENwGl3zSNNaUGWX33Hvka4f+aak2hzEgkT5SsXQNwnK8qQpzFjoCJ+F9ca+6xY
         oaEBegjHdGybt+yuN+ywlyXxMQzX3IfiV1s7Kl3lINkWu7o7IrWNaGWmI97gWrIdPSu6
         2SWm1f5YBQ1ljp13m702HRyVhYjLUBEK77FGAJMwdVYxM8/RdjWzD+41W5kbO2OXcEG4
         wYvusoGRTe//9tLXfBiLnkoOC3ihtHu62t/ToTlPe1SSJe8MUD3Adb94+aBSsuzcsTfE
         p4Wg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FtFTpxiB;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 00721157ae682-6f3e77d09ecsi237905957b3.186.2025.01.06.12.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FtFTpxiB;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-34632-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5802160EAA
	for <alex.bennee@linaro.org>; Mon,  6 Jan 2025 20:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30471DE3A6;
	Mon,  6 Jan 2025 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtFTpxiB"
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC941DFD84
	for <kvm@vger.kernel.org>; Mon,  6 Jan 2025 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193792; cv=none; b=hNBM947nsxMaP1dAKg9HZsK00sEJjgTLqL3LDzcWHuk4lKBDeroXLaRm5RJdhg8C8Wgf42PPCbaIYs4sECcyx2fdFHlnp3NGw2NxaWtnFsY1vmbJHH1PsIx02EBdCqO2VyFy8rjEy0CBlRZpi6jUjFian5VggqSPmyYFVC4Gl8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193792; c=relaxed/simple;
	bh=Ak+0noH2olxVQpIo1L31xnnodJjTrz0gw+USwBojjz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJ3fG5zpbfGD7MPTt97CdqMaWvH5Aq28iodNNyW3gNeZ6L8eKmTpMYdRq/PLBNXRs6k8wkrTQRZH0KMFWqvv8E7iPRldGKLxD9w/2FSVSWuXUgcE3K3MzsUptY1i4lKq/J3taVTknlYHfi9mOD02AgKUs/zyBd58R0krlhQY2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtFTpxiB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863703258fso9209144f8f.1
        for <kvm@vger.kernel.org>; Mon, 06 Jan 2025 12:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193789; x=1736798589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw/8miEe/PnaBFePSWTnOg3qI2ZvVUjrjdrVrAxgzBI=;
        b=FtFTpxiBe1AcYGJZmJxROmdzoEyI8qgZ+h3laLGOWvbT98PebI4PHNOPlwxpbqWdbM
         0mMHYS/fDRa2VNqac0BcOwSoS5KHCa80E4Y57h8zqyTQR4xSJzEWzPonzZezdb36A978
         cuiiGc2zRUwzKdIQJdId/UQH+DZ+gf6ORP+mZzVaCx6NchyihzaFAeyJ4hh1oF8ijqpn
         UQjjClSfyFrK4Gq641sLLbLjoHpg1J/meNLJWniBw2pMagaFKJSN+m/sdn0BC59v3ki+
         eBq/R61xJgKcDbnLbWpBCRLDGOrbD4NZdwmF3kEokx1KgJZBJjjxFGi3bzCzZkEbc+jX
         A3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193789; x=1736798589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw/8miEe/PnaBFePSWTnOg3qI2ZvVUjrjdrVrAxgzBI=;
        b=Y0j99e31skD3xG3Xn9s7SzUUYEFIK72CVG5+Ro93/k3q0k4WeTfSPP15ETutPr+tyk
         eD7ItNnYKhvqfZidI/HUQGvGn2CIw7L2st3f27eBA7ZejJSWjCI5CZ/P++MgeRvhtjyr
         QX5EClvBd/xZaffJAOm4jBWf/4iWq3pllRGh6XLyQLfklRuKD94WfU/kgOOXxVh4KYJ5
         wL+8rxf79wMqJ6wdDJy3WF79zC+/EAzaieitcBoJllmkpnw3MSLAkDwBb+9kwMuLAMV9
         F0/ZgFg+SgtLfc8ha6D4HtzxS2RxNjStBACKKFfawb97YXiRMfk7xk0RxQl1qBSy4fPz
         +Ypg==
X-Forwarded-Encrypted: i=1; AJvYcCXyLBBXB0cOuOB5lyvh+DfjKRdhH1akgPZdk1tg26IudkMkp+WILy5Z4bhd5e9c4+uXbRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQznLR8qqvrFO+Kyv/FoJfuUl4rMDq85DCfDq//HObG0fwdg/Y
	963wt5s0QCs5Wk1I82mq5wogDZ43TVa29Oi8LLI76dcUW+yYNDo/wNhqg+McWX8=
X-Gm-Gg: ASbGnctPsGqwEJrNISIpDS/qlMtGEGTwtXGzGIvn0ictZuFx0qHuC739ViRxX/94mxB
	r30LzSDJLp/RnoIi2Ov/fcZJ7+xmEP9QN1hTw9ozoyl7Vd6IsJUQQ3iw7NGYu5K955ePvMlind2
	rUEiMXm9j96sH3XRPomxtg0pIt/IXRFuckkeu/zOSg3SsRLj841aYo5GjMM7KzyxLmD8eobn9KA
	o44BEN8Ir7ZSJTcijma97zHTxlwj3iiAGMLdrF7s8G9YlaBM/h7xP/NnrNLzoNxgIaq+25zUA6G
	80jII4A74mLYq7RHNbzgDtyNoD/TKFA=
X-Received: by 2002:a5d:64ac:0:b0:38a:4df5:a08 with SMTP id ffacd0b85a97d-38a7923b959mr440924f8f.22.1736193788891;
        Mon, 06 Jan 2025 12:03:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43665cd9c29sm559552815e9.14.2025.01.06.12.03.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jan 2025 12:03:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 1/7] cpus: Restrict CPU_FOREACH_SAFE() to user emulation
Date: Mon,  6 Jan 2025 21:02:52 +0100
Message-ID: <20250106200258.37008-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ynZxCNjkpmhj

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..48d90f50a71 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,8 +594,11 @@ extern CPUTailQ cpus_queue;
 #define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
 #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
 #define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
+
+#if defined(CONFIG_USER_ONLY)
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
     QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
+#endif
 
 extern __thread CPUState *current_cpu;
 
-- 
2.47.1

