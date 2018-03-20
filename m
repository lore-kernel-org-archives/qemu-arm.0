Received: by 10.28.91.67 with SMTP id p64csp3535263wmb;
        Tue, 20 Mar 2018 01:08:15 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsZ5BUc4hxqW8hiPpAl1TpHcHtO2tDWaRTuU4fsvbiTH20/OYVhgOhAL6VOw79c7U1lvRXj
X-Received: by 10.55.24.1 with SMTP id j1mr22705066qkh.23.1521533295256;
        Tue, 20 Mar 2018 01:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521533295; cv=none;
        d=google.com; s=arc-20160816;
        b=xqkJCJif5Yh0eYXPHY+D4vNUyW5WhLhJ9hvo+AgdCq+6PifLDg4rTNPjlkPspzGhzp
         ur0QnemaYS5zZJvTcSSyoPfHJnfzWloKrz5QuvZtiKzrZZ9RLRKJ3n4/TR+ls+IzQ1G6
         XWHN9tgNUDhCWc80msmJSZOeWFthOTPXPF5CAtzF1M9jAWMeSTS5srXednosPQqjlMpm
         EwnFwkIbicnFZTf0etzAsYbPbAE6qy7tM5LLmTgknmAwSOQoia87tQVyQ15xro9cOHL/
         8Dchh9R5RkjN2L4I7OnkqiBc+B4ADJRxqmCjw3n2kJsq5gjXzzMaL+sHTN9Wrhew36hP
         +PVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=wcJhX+ZYmWP1cOQ9IR3nGH+1n1kZ3rMWF+4lO6LuyzM=;
        b=woZ5l72ewYVPRDdU9juF/zQu9OPMJxcmr7IJvFIdWmZLZtt6mkIkOU41Ak1ARECG9S
         KfxjE8O+djJU+MyJH9Ks3wyUmzmnUSKrFfEfcgcFebslTPZvdxr7QBkcDqw47SSRi/cH
         OiG+5o+sM4wGMdf2lDvlaG4sL8LKQVFKOmcjTxs0179Mi5nP0QUaMlia6hqZzMcTboTh
         YTCwoXdSOVJqTPmX4FMabfVnlRP5qBKIDszpmxcrDqN+dZS9bckuT8m/T9tqUs3hKBuf
         OrAenLP+W0Cm2L50dGlD3vYd8yFDc7caeMCX6z5KP25l73A3EZb20QnhsLA1CAJKdrOW
         8GVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10si1288566qtn.80.2018.03.20.01.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 01:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyCJa-0003nF-PA
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 04:08:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyCJO-0003mI-Fw
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 04:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyCJJ-0006LV-Nj
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 04:08:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59652 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyCJJ-0006Ks-IT; Tue, 20 Mar 2018 04:07:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFF98406804F;
	Tue, 20 Mar 2018 08:07:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1DA77C59;
	Tue, 20 Mar 2018 08:07:40 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-2-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <95234cb8-c6a5-be7b-f3da-60c24a3c2d2d@redhat.com>
Date: Tue, 20 Mar 2018 09:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1521530809-11780-2-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 08:07:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 08:07:46 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] arm_gicv3_kvm: increase
 clroffset accordingly
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 836Yk8By2+oE

Hi Shannon,

On 20/03/18 08:26, Shannon Zhao wrote:
> It forgot to increase clroffset during the loop. So it only clear the
> first 4 bytes.

Fixes 367b9f527becdd20ddf116e17a3c0c2bbc486920
 ("hw/intc/arm_gicv3_kvm: Implement get/put functions")
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Nice catch!

Thanks

Eric

> ---
>  hw/intc/arm_gicv3_kvm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ec37177..3536795 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -243,6 +243,7 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>          if (clroffset != 0) {
>              reg = 0;
>              kvm_gicd_access(s, clroffset, &reg, true);
> +            clroffset += 4;
>          }
>          reg = *gic_bmp_ptr32(bmp, irq);
>          kvm_gicd_access(s, offset, &reg, true);
> 
