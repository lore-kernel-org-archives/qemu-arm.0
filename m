Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4697wru;
        Tue, 17 Jul 2018 21:02:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcAf+EDrRIvtll7l4J3cS0yRHEVdonNLc6E0d1GX0oEa7MDEIVLkhSrZG4Cwk49ZoXrvbjv
X-Received: by 2002:ac8:242b:: with SMTP id c40-v6mr4278930qtc.209.1531886575716;
        Tue, 17 Jul 2018 21:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531886575; cv=none;
        d=google.com; s=arc-20160816;
        b=pVJ4xksraZKB1p+zN7/XUO35uK3U3Dlmjhq60nwJ9M/VkF/looPqyxNqUNeQ5W/JsX
         hHgjLn7WH9WQNKfzFykdpwIa0I0zigscg9eRf+tykLPM6qA+g9uuYQkjNpVqX3t3f2Id
         850Vc/enBbHrjAETCJvw0bc6QsGa8kXbnIVo4+zOMgrALWRwi4mRoOtm2sHC6S62Y1Hi
         YXgnWG6DIzJuYC70mD+2ScpGLTRKiLZoQ8tFeMTfEBzB164bPr4MtDl7dSl/5Z/nC4vD
         E212b+iI9tB8b/2fpYXHBQ8/UZ8RoZNjsUCaCHHvMhqO4KKTP4lWB+nWrlj7PlvSrC80
         eEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=41/En2zSyfLrc/0PVjlHD+v5aWvG5vAiZucGkKG5Zpk=;
        b=upK81wpDM4xsrxy7TG86aQ9OsCj5ysYUw9O2nfsbddUSfidB/oiNlf7CqR58h0YOs4
         lL8IA7JcTCV2PS+FtuqrtWPBcVSJLJ8yyOHvOTLEWou2MgyDd9hcF3ZUj5ucmpma+H5k
         a5tLD4j3padY7hUhAmEMjEqSBYxaWpT2f7mXBwrIEknR7xhydLLZL9b8nlm4/bg1031l
         I2PPAZnRcLxCJ81/QejTKTua6bhoVlMXojsUnkRsDu/NNp7p8Wbm1DKGtvRCKOUZfKAk
         G+fQSd9j84+6lom3OtWcNjs4CLxG6ViXeT1rO9rt50rqS8eq6/2BBkUdMSEIAbBhDXh/
         L8Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XH44f7fi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20-v6si2286653qti.256.2018.07.17.21.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 21:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XH44f7fi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffdfz-00012f-2A
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 00:02:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ffdfp-00012E-Kq
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 00:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ffdfm-0002k1-IB
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 00:02:45 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ffdfm-0002i3-Am
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 00:02:42 -0400
Received: by mail-pf0-x242.google.com with SMTP id v15-v6so1534781pff.5
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 21:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=41/En2zSyfLrc/0PVjlHD+v5aWvG5vAiZucGkKG5Zpk=;
	b=XH44f7fi435UA+u3HGOjPhN1SISyZ2lQ212J5q05/NJT+pZ9byS1A8PTqNb8ZMoDLC
	PGnvGgNFs3EngL7wuagGQk1V6hfIHohlk8uWg+ZrZJ84NVMPa10ztRd9eKweB1os287d
	Il35ky/1JiKNaH5bSporLo7AqiFBTsxSUqL0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=41/En2zSyfLrc/0PVjlHD+v5aWvG5vAiZucGkKG5Zpk=;
	b=prATdYSD4Prjrj3uVJ4LhDrZX8Cr1rpkmfZL9JXMNzH06wlQCnuf17ttMEe0L4KkcO
	UAfH0fIu2OUmgtoZM+SS4wgqPkPiO/PKTWQ+HvYBY5FbQ2GdjIySq2b7wBHCrLDYSlCS
	nlP1fpRiH41c5HcXN3zh6yqb476evvvqAwyezU4ih0LGeilqOb0DxbR20RWluWQdaSlm
	jWcV2P0UUklnWZ14dPceW/lQ7f2RVosa8V6GjsFjhytlXmlaUyrxrN8e7ReQBS6b/EwS
	x7VjB29WHb48rG9hrZuVY9MR+T6FqMvW2lVU9yUDBU9VN/wJdqn+YDUJr6o1DnTTiwA+
	GA1w==
X-Gm-Message-State: AOUpUlE1T+2fHRE3Eu0YAt9x+3nx2DXG40GMsqYgWhVkXZSuXhlRwTxO
	XWhsuCfwUXML+JoYkTUZFX39Yw==
X-Received: by 2002:a63:a5c:: with SMTP id
	z28-v6mr4132788pgk.209.1531886561272; 
	Tue, 17 Jul 2018 21:02:41 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	q140-v6sm3443151pgq.11.2018.07.17.21.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 21:02:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180716133302.25989-1-peter.maydell@linaro.org>
	<57aa2f3f-aa32-bcdb-f971-32709e717833@linaro.org>
	<CAFEAcA8FnSP35scTZmLG6_qFOBsu1wRC0mLq5isz+Y_r907i5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1f26dbe0-9999-f9ea-103f-d5dde6c52dc0@linaro.org>
Date: Tue, 17 Jul 2018 21:02:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FnSP35scTZmLG6_qFOBsu1wRC0mLq5isz+Y_r907i5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0] target/arm: Correctly
 handle overlapping small MPU regions
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Adithya Baglody <adithya.nagaraj.baglody@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZvmQvXUpcroe

On 07/17/2018 12:40 PM, Peter Maydell wrote:
> On 17 July 2018 at 18:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I don't understand why this is necessary in the v8m case.
>>
>>                AP                 APL
>>     <----B1----|----L1-B2-A-------|---L2--->
>>
>>
>> Your comment posits two regions [B1,L1] and [B2,L2], that A is not within
>> [B1,L1] but is within [B2,L2] (otherwise we would not report a hit at all).
>> Further, that [B1,L1] intersects [AP,APL] but does not intersect [B2,L2]
>> (otherwise we would report a fault for overlapping regions).
>>
>> Surely this combination of ranges implies that [B2,L2] must itself set
>> IS_SUBPAGE (otherwise the first region would not overlap the page of A, or
>> would not overlap the second region).
> 
> (a) the overlap fault is only for addresses which are actually in the
> overlap (ie "you asked about address X and it hits in R1 and R2"); it
> doesn't imply that other addresses which are only in R1 fault just
> because some part of R1 overlaps with R2.

Ah, that wasn't clear from the manual.

> So for instance:
> 
>        AP                        APL
>    [B1                                L1]
>                  [B2       L2]
>              A1^     A2^

Thanks for the example,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
