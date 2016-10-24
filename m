Received: by 10.80.166.35 with SMTP id d32csp2726058edc;
        Mon, 24 Oct 2016 09:14:13 -0700 (PDT)
X-Received: by 10.31.136.195 with SMTP id k186mr8927890vkd.50.1477325653296;
        Mon, 24 Oct 2016 09:14:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si1664083uau.10.2016.10.24.09.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 09:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byht6-0000U8-1H
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 12:14:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhlT-0001tN-Kt
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 12:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhlQ-0000Oh-2F
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 12:06:19 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1byhlL-0000Ni-OT; Mon, 24 Oct 2016 12:06:11 -0400
Received: by mail-qk0-x242.google.com with SMTP id n189so13488625qke.1;
	Mon, 24 Oct 2016 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=26Mbd/ZsWH2YbNwKZKgl509aCd3Ymcqlq/rzcY9Gc9U=;
	b=cEYAHFHp2aQWUa+7EzeOEtn/PEh8OzL9ETEsANFh1BgFhT2tgklUqYH7+nwPCH9hvA
	RLAby+tWBIInmM6w6CEC1Ktd9y26MyL5ALdI4Ysy6toidHWPzliV/2AfZ/Um5W6P5ZNE
	PR2//s3Khv4tqXHi+3jPBmkWPziTPLe+WSDjaOM0Qx+pmoxq/6L1KCe4izHzTIyl3mHr
	Kno5OODrUoCmsD25p/0rkrnuL4nDgBlHumVjoT/g/U7HQe2fHuhcxay65CERpMwEG1AJ
	Un5n49Tp0yjIge4QEpQe4o6nyCdrKzx/x0DN+iuuiZTxcWb0SkgksqUlydydLItmwoQF
	dG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=26Mbd/ZsWH2YbNwKZKgl509aCd3Ymcqlq/rzcY9Gc9U=;
	b=DklaSQo0fq6mWiV8F3NXfjzm+E6swkEpPiUKTe3Huuy7sOQpS0GTF1Q4PCI8WBK+v8
	2JiBUfZQUW4rfadOosvcpQno92VW5HSZ5jgoEIOCa/VaN00Ya58Uz6m6Z8MDesDZXTpS
	h2F4uSubCCWMFrzNeMFl3BKpKUICKsxcUQlCXJZ2wn67gB3mxDEpwCHcwyXBLCc3Lm07
	rEbxZM3Lj3rL1bAO2x/hjYIBlTSjBKTHTqU00C6lgjLnxoSt1UhLR0jlYWxBK+23X6DI
	APk0oFkCea6RI4fu2EYsNW8NwMsjnUY9tGC8gxVckTJHTkS0heWzmOecpQ2n53XZ/qS2
	C69w==
X-Gm-Message-State: ABUngvf/0ap/2pimiaeUw1//Mb5s4ZxFzLYfza7kCbNSsiam9tH2N7vpya5RQOMeLIGtUQ==
X-Received: by 10.55.103.80 with SMTP id b77mr1918274qkc.142.1477324315814;
	Mon, 24 Oct 2016 08:51:55 -0700 (PDT)
Received: from anchor.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	l6sm8654857qkd.41.2016.10.24.08.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 08:51:55 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, vijay.kilari@gmail.com,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
	<1477288523-10819-4-git-send-email-vijay.kilari@gmail.com>
	<538a5505-fef3-fc2b-4411-bbaa8537c9c7@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <cbdd5daf-41db-a897-8bbd-9558adb90011@twiddle.net>
Date: Mon, 24 Oct 2016 08:51:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <538a5505-fef3-fc2b-4411-bbaa8537c9c7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v3 3/3] utils: Add prefetch for Thunderx
 platform
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
Cc: qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DO1Oic/3vIfN

On 10/24/2016 04:25 AM, Paolo Bonzini wrote:
>> >          for (; p + 8 <= e; p += 8) {
>> > -            __builtin_prefetch(p + 8, 0, 0);
>> > +            __builtin_prefetch(p +
>> > +               (8 * cache_line_factor * prefetch_line_dist), 0, 0);
> You should precompute cache_line_bytes * prefetch_line_dist /
> sizeof(uint64_t) in a single variable, prefetch_distance.  This saves
> the effort of loading global variables repeatedly.  Then you can do
> 
>     __builtin_prefetch(p + prefetch_distance, 0, 0);
> 

Let's not complicate things by dividing by sizeof(uint64_t).
It's less complicated to avoid both that and the implied multiply.

  __builtin_prefetch((char *)p + prefetch_distance, 0, 0)


r~
