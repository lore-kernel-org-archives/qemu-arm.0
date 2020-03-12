Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp853560lfc;
        Thu, 12 Mar 2020 09:32:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsIPjgS2F5Bytnz8j0KTbewAuk/vbCWLsrbRfIz/xoe1KfsW4eOwcoQ3lc0Ei+17npqoThI
X-Received: by 2002:a05:620a:66b:: with SMTP id a11mr8492951qkh.423.1584030733826;
        Thu, 12 Mar 2020 09:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584030733; cv=none;
        d=google.com; s=arc-20160816;
        b=xny0fudX7Kdj4VDe77DsyTLPt9O2klmXnGDjj6HpKfYWXO5REk5IMc4MLRfvW4qMDn
         skK8imO6/4zaNbpoIzeqHagyPnSYiddXpFY969M/2d53ksuNNSBqA7fqGlveHALH2Neq
         GvX9bAhdpP9xyhlb8TFWAfqpmnX0B9Nl73Ty8w0Qk6gXqyJzynzn7X7fg0JBLm5RjA+4
         ++dKXTkoivsJ7nBbheqa3ePBA8rMnzMMjELB6oXYlLoo4qM1sLtyfSZ5jYIW7Zw2xX2R
         SKf3wvs4e5JEOtTWL/w2hTAmq7Mp63gH+jiImmVnjRnWMNUWNCdSQIshh8zc6d8LUA3q
         KXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yci7ESIggvSpzMh2gFyRoUQKy4ZjZUSxsTCXLIHhUcQ=;
        b=r6YpfvpbBj8msPIHXV3Kj6jVhKHce7RsQxNFHGka3+PVWTM/l7T/zuAtui/JohVHEX
         9xpSlIBnLl/Ka+KnzpEJtHVLmmwN3ArubdyRN27hb2ZfxkQ0mPJarIUh8U6deanYo8KB
         Fg5DJro1l+opFUDq+2Yz2QBp6KHirlQVN9yonPxqmCg8kgHEjZkZ7JzrCWBOFDmEIuVB
         ut/OjDF6V+3HbHkULFdGO141oBSe+rgF+dmCya4ZAUbyBcwz+82ERlJ4rTFp3o4Q0bdh
         c10S5hJFBJUmxIGge0+zh5ibkx/byH//n7cy3zq6aqHXAkTMA6qxr4H5jAPxsmuQNM5D
         Sfag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EK5VSVXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d77si3239809qkg.280.2020.03.12.09.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 09:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EK5VSVXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCQkn-0006Mt-1t
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 12:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQiF-0000qV-NI
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQiE-0005Z6-BY
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:29:35 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42984)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCQiE-0005YV-4Y
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:29:34 -0400
Received: by mail-oi1-x244.google.com with SMTP id w17so3808955oic.9
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yci7ESIggvSpzMh2gFyRoUQKy4ZjZUSxsTCXLIHhUcQ=;
 b=EK5VSVXNwl2Bc3ITaplbci5hZ4KA+Ek+z1AlWunzCqXT5Zm6ZPX4QtiT24kOCow6SQ
 qbr5CI33GcjlGFBDT4zubFRS8jd8kj5ys0RB1bjpD9z7T9froMevhN4n0HReJQFMI1RH
 srZSYE9WE3vyRNROwWn/XkVztgKPgBD7DVzaHx/xFMtbGEsCzaUJrK1sU5AEpAliJf7S
 dnlw8B/Wh4n5oLj2lGDW9fboIgGT9zrOuP5E1/Yz/C1n6t8At9HsoM/0CrSbO0zHsb4Z
 k3VdX21R/3aaB6XCuYiQ53ECD+Tb7FmHT6lNN7pu1O0wQU/Fm1Ki/DSoqPxGDh7tb/M2
 GcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yci7ESIggvSpzMh2gFyRoUQKy4ZjZUSxsTCXLIHhUcQ=;
 b=dNhXaQijJ6uY70itqnegzSOHyMKLynoHygSbyctIaa4cvbzAJbciquwhJ0cN8AUgnZ
 kH3je4t4Czbk7FABG3c2jI8FPt7vF38sHOUvE+BOT/eCkMDRY/GpO5qhB99quOKJd/4K
 ey3+XVOC7Tqqe7rdcKzB4ojmUs1bXEBfzllm+m+rKb9QdztZDfGikkaTyTdmFEJnE1YG
 48IAShYLdQmapJQ/JAEMajpCc35Ubnou7187LhQnIJfGtN7bY0/oyTM/8Hw58GlvHy9Q
 3RyExkAgKyHoH6Zp5XY29ZkCBRzfGqnVe/PhcVRPyqf5dBuBjUQUejEkQZG9OFBonXRc
 CkoA==
X-Gm-Message-State: ANhLgQ0+690BgLhdpmQG7EHgQzI8SX9NQNF00SM4u6qNIOF0Wk5GUcWA
 HYo5ouE6/iwp9eZgDAC/DI25RVskSLtZkg/Cu07l7A==
X-Received: by 2002:aca:5b07:: with SMTP id p7mr3135099oib.146.1584030573082; 
 Thu, 12 Mar 2020 09:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200311131618.7187-1-eric.auger@redhat.com>
In-Reply-To: <20200311131618.7187-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 16:29:21 +0000
Message-ID: <CAFEAcA9ZuxSAZ+K1MS6R8U1-ouU3qh=J72tyeNrRA4-k=AkKuQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] hw/arm/virt: kvm: allow gicv3 by default if v2
 cannot work
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: il49xL5PkKd6

On Wed, 11 Mar 2020 at 13:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment if the end-user does not specify the gic-version along
> with KVM acceleration, v2 is set by default. However most of the
> systems now have GICv3 and sometimes they do not support GICv2
> compatibility. In that case we now end up with the following error:
>
> "qemu-system-aarch64: Initialization of device kvm-arm-gic failed:
> error creating in-kernel VGIC: No such device
> Perhaps the host CPU does not support GICv2?"
>
> since "1904f9b5f1  hw/intc/arm_gic_kvm: Don't assume kernel can
> provide a GICv2" which already allowed to output an explicit error
> message.
>
> This patch keeps the default v2 selection in all cases except
> in the KVM accelerated mode when v2 cannot work:
> - either because the host does not support v2 in-kernel emulation or
> - because more than 8 vcpus were requested.
>
> Those cases did not work anyway so we do not break any compatibility.
> Now we get v3 selected in such a case.

Applied to target-arm.next, thanks.

-- PMM
