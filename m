Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp861762ejc;
        Fri, 26 Jan 2024 05:07:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES4+u/VJqiH9BHxcc7FN0eM94JFXAM2RRFyIFKUboYJ/kpBIsv3tov1JIKiOzxtEu7UvU2
X-Received: by 2002:ad4:5f4d:0:b0:681:8c34:7245 with SMTP id p13-20020ad45f4d000000b006818c347245mr1566811qvg.119.1706274474336;
        Fri, 26 Jan 2024 05:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706274474; cv=none;
        d=google.com; s=arc-20160816;
        b=1A0JB0DWasY67e73f/ESKR1bA40/IO6j3DxbILBAQUJ/RAyWP82QcIz5zfzVJDTT0/
         dqgAdXGHgy0CKsgH5b9cXY1GGoNhYAMVlOsAMkkQCriG0t/EHNOwr98q46VFW8PSEOBP
         maYBDUs/ZSn1l1QT83OyNG9akgUCzi/rf+evEhTGecj9xhdW8IibjA6Vr9hA8ado3mn7
         juwY1BQLLsNPqo8RfzZzDYqpOeXrU9PGHmB+Dmu1zq4FaIGvBQJOfYt7cnpLTnEIvF8H
         Rgyf1nsZBUoHhZdmcVn4rtxuVsSU0u/eITYYv4+Z2XbELfi0Qh4Z7Wjqo/Uc2qSls4Zc
         zO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EFmmIYnX5EcJdPs7My/z1SPwf5RyPAs/+fdJolE4HrI=;
        fh=dmGip8yxiMuvedk8neoifo6QSq1Y8wuCYcX6nsJpClE=;
        b=qB4AvWKNz4Crfk2stg6Ebpkbng88mDV1HEmbO25c8MrL2OVa8h0/MIHuUvJNMnKZTe
         X3PMPsYrhK5FchllO7xIBCVftYlfWH+TSXCOaDT5ra5N4awMNLMeh8ipBLBpB1EH2ZqL
         qbMrmwoVLnC4rH0YxnsWi5yTlUXDxXu9Ygp0TvA5ow+CWqjeX20yxG0CNiXzBVTiIWL7
         LdRoBxrzpv1AqLv3Z5s1JeH2h/YZgCtiGCj1Xdnzf5QXXmHtcRCc4aFyOVeN/d8VNhrg
         V6HGCcKEfmiEMkg4wAoMow6lye3oqp27cm+07waVqlykX+8cz/6L6X6KvBN8CifdRHj4
         BnbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6ighCMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke20-20020a056214301400b006827af98e18si1206046qvb.526.2024.01.26.05.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6ighCMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTLvb-0006vB-H7; Fri, 26 Jan 2024 08:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTLvZ-0006uo-4W
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 08:07:25 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTLvX-0000bH-8X
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 08:07:24 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5100cb64e7dso605973e87.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706274441; x=1706879241; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EFmmIYnX5EcJdPs7My/z1SPwf5RyPAs/+fdJolE4HrI=;
 b=X6ighCMkfQGAB5MRb5ZtbDhhOWKe4loyimFAqAOfuH+V0JhVNjTg5X7iN7cCICwp2C
 1NhHoVwOsIJOc8Ue4937LbPRIF1twkB1IK6ACIOyU3zFOmCBDL4VHGpp3cduobvJk6ve
 +BGOxGqcWgzX02u+zsSHLGqv6g4T+fHaZQRcBFJjsNjK1nDaqpoTCItSDPVs9U/p+DFM
 5yU9B6+udl4qD6ZuXKFyKyPf04HVODKi5L0lecwKwmOFv6CCqArzRaYK9qhFYssCGuoo
 64dpXHFprRX7O9lMbUe436/bz4/SwkTOImGVZe9jrbfOfichlvVL0hgXJ9c89dIVv5Ti
 KbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706274441; x=1706879241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EFmmIYnX5EcJdPs7My/z1SPwf5RyPAs/+fdJolE4HrI=;
 b=U8iSz+j7bF7RRuhOJyv8ML2EShbfTALZ0ZD0RgODmNPt7Lv7fbd0NecwBrLM1GT+7c
 eQmeBFMIwH9X4qajtA62ERWINGtzIPHFVAWCKr4NvQXRcacYs8BUsEMTNQz208qggAjW
 vJZC05aLdT1sPFi+4jv0N5c28JqLTqPHnw0BqqbyPXbiFDly/8wYM3+EwZ906uol+np1
 3b6rWtIUD4S4QBrp2uaOXc1BVqhVsO4Y0aYjGJnwZJjSeRBYxW8ZmpFSgrQ/ldWfNKhd
 9NspoR7uZ5hGoBNATZleVdTNKQUH8BH7+ZSqVPvnslGkZ4uNvxXrXLP1WDOFV8bKwipV
 6zwA==
X-Gm-Message-State: AOJu0YxTPjezvyQSDH3Ov7euNdgc74KP2alaqnYbKVWhWMk+zFDTP1lV
 3XY2Tg6Royo1DQ2ENTZ2n6iVujLCy0lr2Pn445dH69rfeYYssSMNy6cmXf4I1jzBkSAPbixsSqM
 SVJsD/sXxXYV0WBkmodX0UuLOYKspqh9Fdv4+nw==
X-Received: by 2002:a2e:9684:0:b0:2cf:2111:4e48 with SMTP id
 q4-20020a2e9684000000b002cf21114e48mr514991lji.52.1706274440829; Fri, 26 Jan
 2024 05:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20240108140325.1291-1-n.ostrenkov@gmail.com>
 <CAC8KSA2ansk83=JL2GNLXSgvXUnpHMEf2HtvARYnpViiWTVtRw@mail.gmail.com>
In-Reply-To: <CAC8KSA2ansk83=JL2GNLXSgvXUnpHMEf2HtvARYnpViiWTVtRw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 13:07:09 +0000
Message-ID: <CAFEAcA9Z+usz599L2BHwXjgdHkXEkKRDLO3Ft0ZQccoEK6yWWA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add PCIe to Freescale i.MX6
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: mxrvosvKjwQj

On Thu, 25 Jan 2024 at 20:11, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> Ping
> https://patchew.org/QEMU/20240108140325.1291-1-n.ostrenkov@gmail.com/

Sorry for overlooking this; I think it got lost in the post-holiday
mail pile :-)



Applied to target-arm.next, thanks.

-- PMM
