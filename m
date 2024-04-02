Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4068933ejv;
        Tue, 2 Apr 2024 09:27:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNcomyZUc/m1rpFGKpE2bNRcLLAKN8z89ZHLWgdAi3btgXzRC6QeiklZAN3WO5HTz7TRuNWKvWF1724Mg6pDYUeBODOUSF
X-Google-Smtp-Source: AGHT+IEi3tbGOPcHo8qIqs1vah4m4c5vi9MR36BOITIGPjotCdw9eQ3mKBKYRgvtR52hEY47eOHi
X-Received: by 2002:a05:6808:1188:b0:3c4:f647:da4 with SMTP id j8-20020a056808118800b003c4f6470da4mr1407434oil.31.1712075232144;
        Tue, 02 Apr 2024 09:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712075232; cv=none;
        d=google.com; s=arc-20160816;
        b=OEOtL86qH0CPDTHZSUn9PseIfMJ/5HRk0osJrE0zOqhetRbujA0ssczPEHnLMFWvB9
         ITfla48OVvfHUi4rG/G40KOAgfxnMDZGNZu0ewr3see8sAnwkXcTz5wkDIAk075DUCkV
         bTvFbh3VTN9ZS0d3ADDy8GefUBNLK2mSxISiqfneJnsLAgRO1gmwCIw2vekyPf4bOMco
         rpeZij7Ri5ywrwtazqPLTAHPPlk2DYkTPeRftLq26BWjLm/oKYy7t+2bjawzZkLH7ubq
         NxFjYq80C/sLrAjhPzDDqOBFC68vkjFEupBE6c58eI9c9kQgYommmByoJNVf5DkfkLAg
         k79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KK9NTlpRrRxEgAvHn/mL2lF+E/6ZZ0CVXpnhGp027WI=;
        fh=Nr7lMv1/VMQEA+aooeE8svmGLDXR7svy6wb14Wz8KQM=;
        b=z8zMD+8Uzs0qZYYIHdQwW6H5hdyYwhBa3VT+2vz3f/rEE1N9VMM9oQ4N63CHpn9Jkv
         06kIAII2RvherM9qFX9lqhs6incC45QULDWjL+CzEn4GpZfKq+J60h3J3QUxZDCWNtW6
         krNEB4O1IArEnW4D4rFkJ1Q6gO89nRGYl8rMG5Eu4hmehesm33P2t2lEt6FlpSW91s5X
         U4tkeveWJTyAjubI6CE7CcQcHAOhniB6Hl14zvT+3McIKFlK2SjxbTmEY5pNX4Llex+V
         c6OBjKjGKrbZ/tEVFawq5btw2hQTO0YygCZz6kKBIbkmL0EOnoVfwsKttXVKyDKROybM
         jChg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1F3EIYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05622a03d000b00432e1d9ccc0si5882792qtx.734.2024.04.02.09.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1F3EIYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrgyE-0002sS-2P; Tue, 02 Apr 2024 12:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgxa-0002Tt-9d
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:26:08 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgxX-0002ZB-AD
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:26:05 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56d5d4d2e2bso3378153a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712075161; x=1712679961; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KK9NTlpRrRxEgAvHn/mL2lF+E/6ZZ0CVXpnhGp027WI=;
 b=Y1F3EIYxnsmoa+FnXChRdg69ABIcPjsm7A7ZLckJ66r8+A8ANv3nJ8wArOJxfG6Xtj
 lZVcIN/56vsqS9DhCTZsOhQlHSuKtNKpC7VORvKF1hly3iKulVTtlxOGMtpXTArAOt0f
 4Twc970LKvFPF3c20KmhBnHcGDXwTtsaymLblz7FNkkV/M3Ps4/+ErzV/CuqCt006y8Y
 /kdsMLwSkRcEj48AFciTt3RsQ0vt7e8z4GvJLipjiEfGzGo3lmPj9y+HnYy6+gkrWfp2
 3D6qDyvfsECyNS/uYi+w9db+Thor2I5EbzYeGNYJ2jgxu8tvineMkLmscX5IzT9mvPM/
 XE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712075161; x=1712679961;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KK9NTlpRrRxEgAvHn/mL2lF+E/6ZZ0CVXpnhGp027WI=;
 b=dldBS+1MSQvq7WuzQto6GFWUqwU0KGRebom2sdL1dYCec+PWNMtn3zy0bXsCSQ7MOB
 m40O7+KvJYNUTG6iSOxHWgryEpj2Y3V8Bgki3fVmtz3yVdsCjua4uuA3CRRWyI8nIeoi
 LxHaDFssaTm/pM6OetLAP8WVsuRjeDsgp7nRcTWtOeF9aferJg3HMNlCSr7jvtkeUOt/
 3ofRX+kGBYe1zmK6LO5o+eUVndXVlEM3nwbn/K+Ou8RY1McD+fXI6FL1JwZpszgTK8sh
 wZtTk/eXBVVrS2bfY9nNIIqyoVzKs4zViCbYgZpeX9U4HSkfKPjl7rKMBGDBgDxaH9OP
 SWpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLfuozdspkS7jvEpqzN/QV5s4TiXIF53QI9KYeZ/+p3C1ToU+yrPtOlRYr42lDTElBmfXALugDID6N8RtdS1yLw35P
X-Gm-Message-State: AOJu0YzN7q1ng1fAog4BBbCj0LQ+VXs1IJldUWpZhOhlbSKXgeKQKf+9
 I7i+m8ecuSzFep3YYlH9GEYcFDQCTiKvSmrakj5qN78vVOhTJ4UHjvcoQjTIGBWmmeG4I/xAJF9
 sMQW0QypoEdB1e7dzmtOHPHVFZAMQ8T/1wbofRA==
X-Received: by 2002:a50:a446:0:b0:568:b48e:bb2 with SMTP id
 v6-20020a50a446000000b00568b48e0bb2mr7418405edb.25.1712075161354; Tue, 02 Apr
 2024 09:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-14-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-14-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:25:50 +0100
Message-ID: <CAFEAcA8kT4c-zhygwr=ifR7_nVk+fhNLBFvkTKa_Mb+UgVMddw@mail.gmail.com>
Subject: Re: [PATCH v11 13/23] hw/intc: Enable FEAT_GICv3_NMI Feature
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ft6vgvK7uh4j

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Added properties to enable FEAT_GICv3_NMI feature, setup distributor
> and redistributor registers to indicate NMI support.

The subject line is misleading, since we don't actually
enable the FEAT_GICv3_NMI feature here. I suggest:


hw/intc/arm_gicv3: Add has-nmi property to GICv3 device

Add a property has-nmi to the GICv3 device, and use this to set
the NMI bit in the GICD_TYPER register. This isn't visible to
guests yet because the property defaults to false and we won't
set it in the board code until we've landed all of the changes
needed to implement FEAT_GICV3_NMI.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
