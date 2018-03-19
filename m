Received: by 10.28.91.67 with SMTP id p64csp2688345wmb;
        Mon, 19 Mar 2018 07:41:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtLXYUsQsKhvV3AjhDBiiigytlz7S1xcGLrJb2JLVGQDagGUT/xlRt55Z2m5yITEp85iLN8
X-Received: by 10.200.11.70 with SMTP id m6mr18361884qti.95.1521470464748;
        Mon, 19 Mar 2018 07:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521470464; cv=none;
        d=google.com; s=arc-20160816;
        b=DX1J0YY3t1ZTRxypMGfa8MXNhX0OerJWgPHNwIBz+EmFIZ7GTp5C93eAJvjK5Nr3eK
         VFWyJvdLuUS9OrotZuBBOL8fRprBnj64fNwdCSsvECySPEiXFuWvTowpiNq/PLB/s/JB
         bfL933wLMlMqv4fGp/atBEAuvqaIbaoXUq0nbIpJ030sg8wUxmqDcB8sYTtmJDuHx3JA
         Xhzw5GIj73O8UhKmV/SjUAUzAm2R8AEWI5Kl+4fAIltxV7NfQJik0KstJavesDU/augb
         xi4g9iC/tophoWQNRF5vRIOJ65VdM4MSdswo1U7sBAcneUAW9q7m5K92JusvoZET+X21
         l3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=Y3iLyGgPY79OBHeIF062Mjl0+kqf8xXjls3lIKb4pw4=;
        b=WVU/L6s1Un56TP33L0iVGctfMx2pJjBCv8XvCHXaCjM+E5RR7iIkZsigONtTBvl6sL
         +1Znu8RJyRI4pavVT8uc9+/RXUadNezAVF3saP7uk9kFcSYvAjOHW8U3/qvmI6HGQvPp
         fAzfTllrwGirSavS7SvJ0uD/QAAKQxMNvvCTdYaK+md0TwxD/9ivTN8cFD2MTkLOTzwx
         e9bTHLR9nnd4IRVM9i856ejjIEfWsaQeKOlUYJDYhbH4CGIlQpxGq1DcL9LFoX2FNFzy
         tH57DMsd74fbdc+pBASDKSi25dUuriiauvNg4hYPVFl52w5AdAKmiQuzXrPBGCN135S1
         cw/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si157435qtk.375.2018.03.19.07.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 07:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exvyC-0002vo-8s
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 10:41:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1exvxx-0002t5-OH
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1exvxt-0007u6-M2
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 10:40:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35208 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1exvxt-0007tM-HK; Mon, 19 Mar 2018 10:40:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A5C982FC4A2;
	Mon, 19 Mar 2018 14:40:34 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-31.ams2.redhat.com
	[10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A821AB3F5;
	Mon, 19 Mar 2018 14:40:23 +0000 (UTC)
Date: Mon, 19 Mar 2018 15:40:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180319154020.6d668399@igors-macbook-pro.local>
In-Reply-To: <CAFEAcA_9YQ4bSzHgM8yLAPtPZ2C70u13kTCLf4rHGPCBUgNiZA@mail.gmail.com>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA_9YQ4bSzHgM8yLAPtPZ2C70u13kTCLf4rHGPCBUgNiZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 19 Mar 2018 14:40:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 19 Mar 2018 14:40:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode
 correct CPU type
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Philippe =?UTF-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQeh8Me8cto2

On Thu, 15 Mar 2018 17:13:03 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 13 March 2018 at 16:55, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> >> From: Qemu-devel <qemu-devel-
> >> bounces+andrew.baumann=microsoft.com@nongnu.org> On Behalf Of Peter
> >> Maydell
> >> Sent: Tuesday, 13 March 2018 08:35
> >>
> >> Now we have separate types for BCM2386 and BCM2387, we might as well
> >> just hard-code the CPU type they use rather than having it passed
> >> through as an object property. This then lets us put the initialization
> >> of the CPU object in init rather than realize.
> 
> > What about the default_cpu_type field of MachineClass set in
> > raspi[23]_machine_init? That seems irrelevant now...
> 
> Igor, can you help with this question? For a board that always
> has one CPU type (because the real hardware only ever has
> one SoC, and that SoC QOM object hard codes the CPU type)
> does it still need to set the mc->default_cpu_type field in
> its MachineClass, or does that become pointless ?

Since board ignores whatever were specified on '-cpu' and 
there aren't any checks in board code for current_machine->cpu_type,
removing mc->default_cpu_type won't really affect anything.

With current code in vl.c and with default_cpu_type set, user will
get error if he specified non existing cpu_model with -cpu.
If default_cpu_type were NULL, -cpu is completely ignored.

But once http://patchwork.ozlabs.org/patch/870297/ is applied
it will error out the same way as if default_cpu_type were
set since vl.c won't rely on it anymore for parsing cpu_model.

So in short it's ok to remove mc->default_cpu_type here.

> 
> thanks
> -- PMM

