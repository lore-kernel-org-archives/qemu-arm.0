Received: by 10.28.91.67 with SMTP id p64csp3863097wmb;
        Tue, 6 Mar 2018 07:30:46 -0800 (PST)
X-Google-Smtp-Source: AG47ELuz3vZ7Mk4b/WXMEu70VJ4C5TEW67IRzMKvQRWlS6KEx9eWVGnVdisRDpUey/OqOp7tS5/Y
X-Received: by 2002:a25:6408:: with SMTP id y8-v6mr2758461ybb.308.1520350246228;
        Tue, 06 Mar 2018 07:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520350246; cv=none;
        d=google.com; s=arc-20160816;
        b=RHIY6DgMFse7fVSn7Cftua/IpUN6qfXS1N6FQdNs0JEpVsTfd8pZiNRmGXsAvx/Ebi
         FGx6laY8YdV6YQM3imit9vvOXfok7qKeSOImElsgxui4r6WslIH46xtF91+PsoKpp8vo
         DW7MVdidEHh2cmz7PGbr9RSu3LX6c1KFxkr/ejy3LwcMaHOr4MKq6dJDSwyvG5mQcYMN
         Hv1goQ/BLVOK2+t4jWoGzcOOBQ1ET9nMPO8psPkPSWJfnvG7m2kzQhMjGDjBmCW/1KfJ
         hYROsLtgmRILZ1ICMRId7WHZUgjT+q+o4QCxbYzTeWgupiyf8fczqxMWDK4+023HO/Kj
         1smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=dRSFU3byYV3Ni91CGLJ15JL/P2/FQvkOkHCL7Avsnaw=;
        b=W3X7U9gRfHrGELckURFY+HzRc4lJR1r8nhN+X/sgJClHJBkREZ43C11o6kBOGFIZCt
         vc/v3gBkkgD+/wRzbAVmYmoIRdI1o/cFRaWLU6VO7s6COZwNwKoyE20orjiHAGKGUpK4
         Xby5UmGRwAJWdIxjlgjk20fBeIU0zv1aS3Sp3pMuIPfb6M5QVenpq86A3QyFAYQCAEvH
         6Kg+edPisY2to77z/kJkMo091jvBVlV+5kdL4Lbk0RjY6NSs1F2+SgQFt5vICHDEyBLh
         HObT/eg9Ldiprh7KiBxGAuvZaVid+yaznxZFzRNHnWoEo9zXl0IiyDdq03kZaZti+KBd
         AVBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10-v6si1322226ybg.309.2018.03.06.07.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 07:30:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etEY9-0006rW-K8
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 10:30:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1etEXj-0006ef-4g
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:30:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1etEXg-0002lP-GM
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:30:19 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:45448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1etEXg-0002eb-5z
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:30:16 -0500
Received: (qmail 3851 invoked by uid 484); 6 Mar 2018 15:29:58 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.051697 secs); 06 Mar 2018 15:29:58 -0000
Received: from unknown (HELO [192.168.187.23])
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with
	ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
	for <khaled.jmal@lauterbach.com>; 6 Mar 2018 15:29:57 -0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
	<CAFEAcA88s2X9qkFVYG6kmeeZj6-bp0uskXb8TJF0HMfUVVSf8A@mail.gmail.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <46c35ebb-b0f9-9a55-b8b1-cd94a29cff3e@lauterbach.com>
Date: Tue, 6 Mar 2018 16:29:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA88s2X9qkFVYG6kmeeZj6-bp0uskXb8TJF0HMfUVVSf8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: Re: [Qemu-arm] [PATCH v3 3/4] target/arm: Add the XML dynamic
 generation
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VeNAq5Hz0444

Hi Peter,
>> diff --git a/gdbstub.c b/gdbstub.c
>> index f1d5148..ffab30b 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -665,6 +665,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>              pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
>>              pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
>>              pstrcat(target_xml, sizeof(target_xml), "\"/>");
>> +            if (cc->gdb_has_dynamic_xml) {
>> +                cc->register_gdb_regs_for_features(cpu);
>> +            }
> I don't think we need a callback hook for this. You could just assume
> the target code has already done whatever it needs. Specifically for
> arm you can just make arm_cpu_register_gdb_regs_for_features() in helper.c
> call gdb_register_coprocessor(..., "system-registers.xml",...) the
> same way it already does for other xml files.
I think in this case, for ARM64, if the execution mode has changed (to AARCH32) the time we connect
to gdbstub then we will get the registers view of AARCH64 instead of AARCH32, as we have created
our XML at the beginning (on arm_cpu_register_gdb_regs_for_feature()) where the CPU is
on AARCH64.

Best regards,
Abdallah
