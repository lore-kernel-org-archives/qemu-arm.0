Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp126771njb;
        Fri, 6 Sep 2024 08:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8+gWcJBPuL8jD+HZ2vpDn1D7WC/e9kLPk7/J6COtWp3L7KEKXM62+T/fgnKv8vMByLqjFVS5clQgt1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGaJ4Fa9FvaCEIiCl46lbSqL68kZ/GU4jIPg0jQmU4H1BwjgBOgewQRW10Nq6VycBdsr3xW
X-Received: by 2002:a05:620a:2955:b0:7a1:d11c:37d4 with SMTP id af79cd13be357-7a997340688mr245213385a.29.1725636737261;
        Fri, 06 Sep 2024 08:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725636737; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEVCVoNmCONG8Wx/il/uJVVnEqIsCCx8PzRGgi+ifa5tHhlqG1azuWlOONLQEgbblu
         s3LwyuA6/ackDnyxtJa7EIGK/MNVOoVd+9FNkilR0JW7DRYvGNpF6hG+gsyI6GOpimT0
         ruf+vopIw10tCSyOYbhyHr7/woMjdzVcisI8jmxqELPucRG42Ic4XQFDo3GJMLIDXiyx
         GjGZXzafCnt68Y2+PsZBMnkGzklCki/PRtqQ+piC1Qiug+hNW+EnwXgOMWy3CaE1ZNll
         E6QNSFmDRzWXTwLA78ulh8M5v/Ht9gxgU6AMaQbSn7YDfoE7Q9U+rP8oQOr0Qd427rj3
         AUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A9+gbxCIPjczikelfZDHbBbmO3fyOOpEb+ES5eFNeK4=;
        fh=WA5lQGmLg75jpr7hDkYbCFDzKrSRtodufsGjayhxOsA=;
        b=VBlW7WQ0ZhFwagxBpai0eD5j804D6XK4NooDv2eUC6L+IS6JKBeh6x5ioHgb+MB87h
         ig0ps/aAu8BqOxceeTwRH93pW1BclXAIUWPsiR8U2rT5iR5bY3V02A8RYzitwiqJw9b+
         esrHJmssAXP+PwMYG+Kmh+YO+6+YPJXMGDVFeo1e0xkDK5wu/2arcAi2u/ilS84br0vw
         yVrf4/MszLy6IRWFwSPQKS9UWddTpPXDj9OX3r68NoIl7sHyAmqU8+zgN4eRGUuWNzxh
         il+TXKSp+0LyXUX/hyA+4GnK47FStIv0ssEhv2UMiSQdAS1pQAc8OhUCyPeFEw72QQLs
         sOmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5TH7BuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a101ceecsi53329985a.74.2024.09.06.08.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 08:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5TH7BuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smaw6-0001FH-TN; Fri, 06 Sep 2024 11:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smaw5-0001Dz-84
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 11:31:45 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smaw3-0005vL-IW
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 11:31:44 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so2768416a12.3
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2024 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725636702; x=1726241502; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A9+gbxCIPjczikelfZDHbBbmO3fyOOpEb+ES5eFNeK4=;
 b=b5TH7BuXbNVoqmMAeoeRBRJ6CkyLPS2GpHiNvzDJ+xiAvk3DGeFi37qlmsIia6CFll
 47+Fh93bEY0pYXGHRac5k5l5fOx97Cmkv3JtuuKEFNr6CuFksrVS7CEZj8j8k5KEsBAu
 nQ5mSDtS5migd5IFssHBKsJYkZ889L88SSWAt6G71UQm+iFd9nqhGJ84+6ZyywcRtZzx
 4POPnPc47JzKSVKEqz9wn+Wux7B/ysCKQ7+dus55Ek0A8W1JzlPnZ3BBPWJj9CICL5rK
 X2IY5Cw8PJFTbteObpjT2kHPKEnB4UCkefQDK7WPESPeF1a/XPtLKeJWqir/vNx2fgF9
 cJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725636702; x=1726241502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9+gbxCIPjczikelfZDHbBbmO3fyOOpEb+ES5eFNeK4=;
 b=j6jjUlgNlAV+GRbL6jMjl8FaZ47FeNS+eqnuycOAdFkdT9vabEqNX9JnB0qMGpEEJ/
 pmuLKKvSXtuxg5nzyvTLhndO4WOWMT2mo8Tvp1JTxxJ4MG8iVbIpKPjf91jXxxvH+7M5
 c5V5Mc0avbUOGEHL5S8zEAQtpdDqkJHCvsDgm6MSqVoIMkMHhQKK2p1/ulL3Qy9ZXsSZ
 DCmrMPGemO7NBoXpvmSmhr1W9YBpPgZBJDglFt4fxQjbFkcD0rCCinHDzBPDQDwJHzAH
 AcKRUvAqqMJjznstVeqTcUjMSOe7tr5xfkah4Z/D+EaAoYzYfKCRmqybP+fpwngArBxK
 9LIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNSLxInOL8EptUqXZfEMTUKyCm0US2Hgh4luwbJNnNW8Jdwo0k12O/nLTvg+YpMJXtvqRqkG2DRQ==@nongnu.org
X-Gm-Message-State: AOJu0YyjBLPRXpOqNwlbKW5d0FrhIFr0hY9gAdPsBg5UMo8bvDce3iay
 bR050uc9yeTFdcOYa89nitgAxuhhsAolKT/FuUPzhw95AROc7hJk3UA6jMvcjcoplCi+EYIw7VP
 OBqqvRrC6g/eJGq5ntwaACL6v6CmEphtvdoDY1IwMmy751rIL
X-Received: by 2002:a05:6402:2793:b0:5a3:283d:b05a with SMTP id
 4fb4d7f45d1cf-5c3dc799624mr1608940a12.17.1725636701954; Fri, 06 Sep 2024
 08:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240828111552.93482-1-danny_canter@apple.com>
 <20240828111552.93482-4-danny_canter@apple.com>
In-Reply-To: <20240828111552.93482-4-danny_canter@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2024 16:31:30 +0100
Message-ID: <CAFEAcA9ss=VL=hRZMgN32XmeKGjXmQW9aYjcLmSe_sWSAcQKHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hvf: arm: Implement and use
 hvf_get_physical_address_range
To: Danny Canter <danny_canter@apple.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, dirty@apple.com, 
 rbolshakov@ddn.com, agraf@csgraf.de, pbonzini@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, mst@redhat.com, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rn+W/mdfbtFa

On Wed, 28 Aug 2024 at 12:16, Danny Canter <danny_canter@apple.com> wrote:
>
> This patch's main focus is to use the previously added
> hvf_get_physical_address_range to inform VM creation
> about the IPA size we need for the VM, so we can extend
> the default 36b IPA size and support VMs with 64+GB of
> RAM. This is done by freezing the memory map, computing
> the highest GPA and then (depending on if the platform
> supports an IPA size that large) telling the kernel to
> use a size >= for the VM. In pursuit of this a couple of
> things related to how we handle the physical address range
> we expose to guests were altered, but for an explanation of
> what we were doing:
>
> Today, to get the IPA size we were reading id_aa64mmfr0_el1's
> PARange field from a newly made vcpu. Unfortunately, HVF just
> returns the hosts PARange directly for the initial value and
> not the IPA size that will actually back the VM, so we believe
> we have much more address space than we actually do today it seems.
>
> Starting in macOS 13.0 some APIs were introduced to be able to
> query the maximum IPA size the kernel supports, and to set the IPA
> size for a given VM. However, this still has a couple of issues
> on < macOS 15. Up until macOS 15 (and if the hardware supported
> it) the max IPA size was 39 bits which is not a valid PARange
> value, so we can't clamp down what we advertise in the vcpu's
> id_aa64mmfr0_el1 to our IPA size. Starting in macOS 15 however,
> the maximum IPA size is 40 bits (if it's supported in the hardware
> as well) which is also a valid PARange value so we can set our IPA
> size to the maximum as well as clamp down the PARange we advertise
> to the guest. This allows VMs with 64+ GB of RAM and should fix the
> oddness of the PARange situation as well.
>
> Signed-off-by: Danny Canter <danny_canter@apple.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
