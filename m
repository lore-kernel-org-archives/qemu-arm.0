Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C1C83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZojd-00079o-Kg; Thu, 10 Jul 2025 06:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZoja-00077b-Q0
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 06:42:35 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZojX-0006ez-Ud
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 06:42:33 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-711756ae8c9so6437227b3.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752144150; x=1752748950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TYUd1N+JAahkudpDvfY84MdK9+eRklIdz/GsGZ6/ErE=;
 b=I4hNHCJPksF58ALZfNAiD5dzKVwqGVVBwhlTWx0IN/yrZ/6IqBQteZELI99ZIx8Na4
 s/xV9yS+FZ4GbmUeZvITTpkmF39io51JMDwu6DXSdw8S4QbCZ+GL2Lg0nlFmXMarinUa
 EGxIuOv9vaTl8LrnO3oqVOUczxzpSBy05VXHdXot7HbkcB6qft6zc2dS70MIpqsRLZoV
 cIvUqS77grIN7UQD75cI53pSGooJK5wmBnVDH3p2kEZ7ZhNtcFkb+7i7FUWNPAV8D35n
 Ys8Q9LsCUvjMY1r0zbZ2bpRC9xsrzThHL3rW3IWkUBlah8KGSJnBq/z3nEt5ugOEIvfY
 bZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752144150; x=1752748950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYUd1N+JAahkudpDvfY84MdK9+eRklIdz/GsGZ6/ErE=;
 b=Ev79unp8LiV72HKqzgb+AzZg+Fn76/FRhEx6ZZiy9DrG+37TpR1k4sPjB3wgYTQv1O
 N951shlYAkLnk/C8ZPbIT9+GSsCp8wLPFUfAkZTTESq5mXA2A7joK7gj+2jyRfVzk9qa
 UQYIEV2m6fO5V+tF7q9CH6Cb3mesynbkEdm7LvPxpUNlcv/hROxmKjgDR8pW0pvkb4I3
 rpfpZ0KqIQzQnIq/+fDhnozLOGMMod3+5CWDS9zGCeOoXZ51fu5k6/WeawqXOYVcr5Cs
 Sb6Oe+gjc/GYhrMLArErvn4kHa8Sxy3CEASQ+FCdEleAlw20Uw9FXQipbUriG9Z1NWke
 TL3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCQ9cJI8+nBjvlTCl4WLqVcwHjDQT+0iyZYSteQoAPxv/y1AyfjxKVj8KaqIyrGybzKmp2/ANHIg==@nongnu.org
X-Gm-Message-State: AOJu0Yxs4A0jHjrF0Ju113YynN7y7OyxlyiuezFgwCIFIr0vyGhVOhU+
 3P115Dk+otycuxONXHEbJCHt45bf6hDwUYnSs6YY0A/4V9Pa3AmqGUP4rlC2M2GHjd9ofFKgut5
 FPtsrZsoWoJAiuioNfAMBG8AK5wPVD99E8hjQcOQhTA==
X-Gm-Gg: ASbGncv1wJwFOLx7qd8vq++xaG6aHVvSL3CwBzJyyy02pGht9yyFfL9KtikCf4gWogi
 UB4txCIdS8vCwcIBHVoRG27C+dx8Xd5gisHTGqDHIuLdiJuQgU2JzHAw+j4RAmr158EgZafevrZ
 0wmjQ4fJfIuo3TeeKQmUoiCJdbaoXWv5HUIB0kyavOsez8
X-Google-Smtp-Source: AGHT+IHiCGHwovoSoz7isViSBPUSVoXdgYA6bFnfTwY9+nQihpv2EG8gfGdP6fUlse33BYQgUKxco6esLjt7lY01+a4=
X-Received: by 2002:a05:690c:882:b0:711:4392:7024 with SMTP id
 00721157ae682-717b1a1b334mr88454847b3.37.1752144149892; Thu, 10 Jul 2025
 03:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250707164129.1167837-1-eric.auger@redhat.com>
In-Reply-To: <20250707164129.1167837-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 11:42:17 +0100
X-Gm-Features: Ac12FXyFVNG23ayDaHmGHJCbt218HGl_vnwPYYPHCilPCzqyUEAkEZHRzDOm8Sw
Message-ID: <CAFEAcA8UGHWLY-OpSZ2CP=LY7AynO_YxS27BzLadegL40VgNYA@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] ARM Nested Virt Support
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 7 Jul 2025 at 17:41, Eric Auger <eric.auger@redhat.com> wrote:
>
> This is candidate for 10.1.
>
> For gaining virt functionality in KVM accelerated L1, The host needs to
> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
> with: -machine virt,virtualization=on.
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v10.0.0-nv-v9
> previous:
> https://github.com/eauger/qemu/tree/v10.0.0-nv-v8


Applied to target-arm.next, thanks. I'm going to squash in
this change

--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2248,8 +2248,13 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }

-    if (vms->virt && !(kvm_enabled() && kvm_arm_el2_supported()) &&
-                     !tcg_enabled() && !qtest_enabled()) {
+    if (vms->virt && kvm_enabled() && !kvm_arm_el2_supported()) {
+        error_report("mach-virt: host kernel KVM does not support providing "
+                     "Virtualization extensions to the guest CPU");
+        exit(1);
+    }
+
+    if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());

so we can distinguish "QEMU doesn't support KVM EL2" from
"QEMU supports it but the kernel does not".

-- PMM

