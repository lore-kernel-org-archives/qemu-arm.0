Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5954585wre;
        Thu, 31 May 2018 06:56:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKozmYsTszcqoF/z7U3UvkQnW5hSHfOxqP5QaEmJiT+IOREDz6U/NRzoEfEJTc6r/Eeddzh
X-Received: by 2002:a37:2709:: with SMTP id n9-v6mr6213374qkn.416.1527775001274;
        Thu, 31 May 2018 06:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527775001; cv=none;
        d=google.com; s=arc-20160816;
        b=uD+wRqxcQ82pEGJrzsUdJvJaOsU0ELr1vgWiM9oHtqS1T1TJOFeavmbsHIsUdijrYc
         WkmRtvSt0I3foP1om36EYRfFttZoyNTCnpceLQ2xhsdej2o80XuugVgDU/gH+P414aqd
         1BeK7dmMXorfkGzeEhxh2XxOpIqAqUj5qcEXHhwzggUSczADn71MS63MT8lgo6YDQgwv
         TY2CyvbBI+pi87cjH5fAYW5gHCm4mjkO7JS/jFgJ5X24bf5d0lEJS8OkT+UF5N5cnwK1
         ztSmKd3Db3B8ujRfA8kpo3vtdkbGoZfoFWQMv42wzkQu4OXPOSW+jpY2HDXUo7sQpBI+
         +UQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/e0aW7BK7sZbqL0DyFEF3XImYjFrl+xJ3TV7cHv5Jks=;
        b=n+lEHbBvX+TsxGHgvrRo3GyHJocDM+mjMlKm7z98jiJRydFtxPwSBiimrbo8HE7l99
         TYxNKzQaKrbyomX+ivcflzBmA6qpqKe8381/CQ0Nd3BvZZRqONZuLa7VgirVXcz2shOy
         wySnrSpN9VD8IKFxQpYl9ygYI3GjQ9b/GCebo7F3rtmXwsjCKxdu1EOpWyrVmjJTWNaZ
         pPztp+LDEZ2lO5WAUeZQQdOjV0vAIfykCWPFFNvvY2vXqxVevX+hrs5u8lM6bbL2TUcG
         L6JnYOxlrlxU271jOpBiGsgX5AxUqPHKC7m8Qz5Hrex/MTrE39Jv69n2WNgKH2nfUiSd
         QGzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UDnPOQP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 81-v6si6725857qkg.280.2018.05.31.06.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 06:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UDnPOQP9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOO4G-0001eZ-Q3
	for alex.bennee@linaro.org; Thu, 31 May 2018 09:56:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOO46-0001dS-DG
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:56:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOO45-0000WC-KQ
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:56:30 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36024)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOO45-0000Vs-EK
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:56:29 -0400
Received: by mail-oi0-x243.google.com with SMTP id 14-v6so11554936oie.3
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/e0aW7BK7sZbqL0DyFEF3XImYjFrl+xJ3TV7cHv5Jks=;
	b=UDnPOQP9we0OBEWuH7lw0oIQwmexxWJtxwstUbUnFG3XmkJ9OLLwrVkTDHAROGhG2J
	8WIUA4JFOFFSrA/dq275l/pNjr2R5JNNag/swkOOJmtn2kQsRZKAkQFHUgtj4Jh0dxri
	bUQnLdwLUARqcECwjUBSBvBalVw8pydg82LPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/e0aW7BK7sZbqL0DyFEF3XImYjFrl+xJ3TV7cHv5Jks=;
	b=RG5KY1i1Lx/WM4g7qm0GGrBXgUUx9FKcg4TxN05/ro9WPnbT+4Oc6eXVPHpSM6oCuP
	WfhYTcZci/9sCuohoL09/pwfh8oFB5oswbKdHpeunYftxluC7IGKCPLf2o0f6etk/KNs
	dhcW+8XThgvkTQpVMCEP1bm4kYv9Cx3aPQo45WxAGca6/okkkWvY8RjS/u3jWKPJLyeA
	GZbHxjq02jzQhvcvVwd5IgCXe5IqZBqjhS7QTjj3Yr5AD9+fa6UJWYX/wW8YZRT1anAK
	8G5EXhUpHubtLf+s/m5jkJcgQfmva/e8XYoaIO+zpyOp8U/E/9E2t5MdBoNC6mgTcCMh
	5BpQ==
X-Gm-Message-State: APt69E2gtF7G6medqp+HUYYjUx4DAQwahfyvYNdqQfpxJZgjp1/em0Ke
	KZWD+DiYJNDItSINX7nZfB3M83yzTeGzorRqAlEbyg==
X-Received: by 2002:aca:bec6:: with SMTP id
	o189-v6mr3769291oif.337.1527774988632; 
	Thu, 31 May 2018 06:56:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:56:08
	-0700 (PDT)
In-Reply-To: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 14:56:08 +0100
Message-ID: <CAFEAcA-+59XXTDypmyyDTjVVuMY=b8MF5HusVfAhZnWy=Q-56Q@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] KVM: GIC: Fix memory leak due to calling
 kvm_init_irq_routing twice
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XryF7x0dMA0I

On 31 May 2018 at 08:16, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> kvm_irqchip_create called by kvm_init will call kvm_init_irq_routing to
> initialize global capability variables. If we call kvm_init_irq_routing in
> GIC realize function, previous allocated memory will leak.
>
> Fix this by deleting the unnecessary call.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>



Applied to target-arm.next, thanks.

-- PMM
