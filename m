Received: by 10.223.172.38 with SMTP id v35csp544292wrc;
        Thu, 7 Sep 2017 11:07:51 -0700 (PDT)
X-Received: by 10.55.215.67 with SMTP id m64mr225961qki.315.1504807670920;
        Thu, 07 Sep 2017 11:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504807670; cv=none;
        d=google.com; s=arc-20160816;
        b=FU8pftfZ96TyNiqXLGdLphp0SGA5SqCW34WfMTEcz0lN+1N2oTH4qMLjcpIew6RMq4
         CKBzlWSVnCeUYq9pjHA2q8DDzNVFrm+Me9y6AHxmHoVsxXxyppexz1KAEV3ymD9XnvpZ
         e9SRZPkjY8JXrLHdaEFymQ7diNBZxVlMo4vMjEMNQhOIpoMbseW3PUwDFRUnV4VxeycP
         5EOETwzz+zFmZMbZZ2sWg5LqrD12rTu7Gb4ndK26cVbdCtVq01m7zBIyYPmj+MULx8Py
         5oCYUKGFQNvff2Pfn00tLsWGNK9iTxxLKTi+I1eJPfgIcWuwcHWxIZ9P4uBDJPB3gksW
         mC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=gzIhX18FZMyLt1STNmp+BC86wJ5+Q2E/PxMznNR0cJ4=;
        b=BkGRyO7+cPEOWZsdaCajgQf2N+OP6Z9l3NbdeFQtxkNYv9iOSODU6E7uFNIn/JFfxZ
         edoFnQSfZwZ1iJNXXr8ah0L2M00g1IBb3/Whd48HxwzXoKleB4Rqqc0eIvxiME6rzreZ
         8UEoWNuduoZkWTsbLSJCM08uu+ZokVxDxfJ4siWxBiaOqu1t0/bNYh0Q/KLJvWm006x9
         Z/OE37YOdyjy/HyGQJUSqVemxyTCZs+cyqnhbqrcA2U/mXh1uLNU/euEEZGX6MBrAhNX
         Pt5akwC5DQ/NcDBjGiOrwS8Pwqvn2+g9zDnVD2sFWtEv+bd6uzrIgvYlwbi3nZBfAWc8
         R2Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVKee9nJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si250079qtd.553.2017.09.07.11.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 11:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVKee9nJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq1DQ-0006Fc-Kf
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 14:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dq1C8-0005KW-LB
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 14:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dq1C4-0006u5-2I
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 14:06:28 -0400
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:33168)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dq1C3-0006tS-SG
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 14:06:23 -0400
Received: by mail-pg0-x22f.google.com with SMTP id t3so832252pgt.0
	for <qemu-devel@nongnu.org>; Thu, 07 Sep 2017 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gzIhX18FZMyLt1STNmp+BC86wJ5+Q2E/PxMznNR0cJ4=;
	b=BVKee9nJpqrTphFlKow2/ywN7gJ7ztd39eDxrrzXd+LpJaLjpdBoUEgjIZHGvD5PNI
	mDQK53FcYKKo7Zdlaa11Gid+m6EBzC2kpOckRSiEfG/vbsbDn40K5TipcZzOTfgV9boH
	L0i1usXMKzWcJzhbilGo+lGP3Gs/XE0iVcn+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gzIhX18FZMyLt1STNmp+BC86wJ5+Q2E/PxMznNR0cJ4=;
	b=B0fLt7Vz7Xcbp/H/SR1N3kGqkAPoYBMWtJBg//UA8Vyt8Cp/0gieuoywwPnkgWh2RL
	cnyNNou6K0yyH1uOQf2bggYzyWhd/zRohXpG3bnl4hO9p70Cyxp+NAIpL378Ih8rfZjr
	51iNPgY++K2KRJB0URTrVtykk+iq4a5UkAKFgjdI6pZf11WPOfYkLsKp3CLXjkY/1mqa
	PC18j6U8reuuANHoMNFy3bStBNE8Oe+5NFpxr07aKt7zGsqf5KFdQy2Qd3QazwfnigAi
	PeiFAye4ikjQUcsBmB4hKuAt9L/sDGhQUKDwF9Uo4HJUYZwixJkqkXBnRe3tY1zkmov2
	RCAQ==
X-Gm-Message-State: AHPjjUgyF36NaPSHuf+bsssq69DzJcjTWJ1i6txgy09HShsrBePpFbkp
	R2ElL/pfFWcdtY8U12b5tA==
X-Google-Smtp-Source: ADKCNb6Y+OB6mhiyrefDxq3gXRD8eOX7KvC9lOGchCxc7+/52CLufgMh914NQI3U/SEfG6NrlTnmqg==
X-Received: by 10.98.76.134 with SMTP id e6mr214636pfj.180.1504807582634;
	Thu, 07 Sep 2017 11:06:22 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id g5sm197226pgo.66.2017.09.07.11.06.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 11:06:21 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
	<CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
	<CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
	<CAKmqyKOqOJJceCf-wMjZTMQCHDjHWGWT4JAdsqERVXeNtTP6dw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57594b14-dbe1-9542-6bdb-eb0b5dc1314a@linaro.org>
Date: Thu, 7 Sep 2017 11:06:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOqOJJceCf-wMjZTMQCHDjHWGWT4JAdsqERVXeNtTP6dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-devel] [PATCH v2 0/5] Expose the secure and virt
 properties to the
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijdDQt+651LL

On 09/07/2017 09:48 AM, Alistair Francis wrote:
> Hmmm... I'm not sure how to look into this then, as I can see the
> patches going through to my personal email address, so it's hard to
> place the blame on the Xilinx mail server.
> 
> Do you want me to try sending out patches 1 and 3 again?

I had this problem with one of my patch sets earlier this year.
In the end it seemed easier to post a link to a public git tree.


r~
