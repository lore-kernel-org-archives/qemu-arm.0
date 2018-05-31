Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5941671wre;
        Thu, 31 May 2018 06:43:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLMsKI7NecYqWWqrQzAe+he63RzuMqdTgDwdpDhXfUnDJabQ6nEZlKTVs8Y+wiGkYHblggs
X-Received: by 2002:ac8:297b:: with SMTP id z56-v6mr6460803qtz.387.1527774200966;
        Thu, 31 May 2018 06:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527774200; cv=none;
        d=google.com; s=arc-20160816;
        b=vhh7MA0KvjNUTchcNP0LJz9TbRgndJCim1mWd0W1IYCugxK23vj0fsYWR4Zqeh0Scz
         FPQQMcI64FRWG/PBV0OG6CTCP4uAKgbVGir3zwp1V/+zBNRo5TcWQXU/otLeHLqh8TY5
         APv7mnIMsqGm/LOz1GjACUTYZxoJULw+7uMR4XeQLxlyoinP6HiPdNJMrLvJX7f/dMYS
         3wUWmyJvAV+OJ97dMPpYT9S0wYj0hIQQh42QnC0DkHINidniNnUpq3WOM9NNUjqqs9Ij
         oeSR3aV+EoBAnBFDHMqVxJKE70jzDze9OHSOMZjwL2JtNvDrZ0cC4MhnrkUbC3vSAywd
         +4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vJXqWBeb6ZcFiHwihOQrJp8pYXTQP7sIK9YH6TkyK2I=;
        b=Sj0nz+2rErB36C2Mphxx/Bm4cbRobSiwyyY1uIpa7UoKbFFRiYCngo/L5aZLDSwKIi
         lie6KTpMQ9wsI7mahayZskpAG0rR8sNtngKHry2JR2OMIPsKVTKAkR09EWGfnEfOAlCD
         m88+r+7WYlhA7bLqRFu/CWq8GwTLR7ni00hDrHNd61HZ8xrBIqvFwWzY7eTWlNPfUgcP
         dAv6FmjvrH3vZkN4gpmce+fouPRJ2Lc/Xi6RBhWHE7VfsQU5JIdidYx3HSF+/VObY4Px
         5Shz9V9u4QtpMc/wTwjPS0VlTGwCfffblAOopt1B6SGQfDH5f/FlgeeQWIlPzb6Ze7sI
         ueQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpUZtE3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p26-v6si4981016qki.15.2018.05.31.06.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 06:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpUZtE3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fONrM-0005xG-HL
	for alex.bennee@linaro.org; Thu, 31 May 2018 09:43:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fONrC-0005wL-8H
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fONrB-0000Pk-4N
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:43:10 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fONrA-0000PO-VS
	for qemu-arm@nongnu.org; Thu, 31 May 2018 09:43:09 -0400
Received: by mail-oi0-x244.google.com with SMTP id 11-v6so19511278ois.8
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vJXqWBeb6ZcFiHwihOQrJp8pYXTQP7sIK9YH6TkyK2I=;
	b=CpUZtE3+1SzHMTlSQpg/HcAgRJHwbtxYgiHUKmgs9UpWDiMWO7mKBXKeA2h1wCS85D
	SuF8mPpQp/GQNea5t5/lYV7DDsN3s7Jin0IHCAm61o9i90SoR/CZfpKLC9jnO4Uuh1rK
	ei0mFcazBo+GSiid9SNfmbwIKhSZO9uqk/8uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vJXqWBeb6ZcFiHwihOQrJp8pYXTQP7sIK9YH6TkyK2I=;
	b=RBQXiQ1AK9y3TMzEJRhgQAliLhbksh1sDWskYw9AEBMj1F/FuSQcIY4mxqdC6gWHRJ
	8QQkb/hhphrgmVgKZkgf20zHMN9ySEdxjWDlStjY/wjRZvhA8Ve2ly7cIg356a55AQ72
	v9Le2KHhFGEhfErFqKIFHpuE2yp0eLzJCPoBIR3HcOQhCpDRIuWGToQ+WsY4TcI+p3Va
	LgH7feSepfl7oJLJ4ND5bZjzjUFDOC/YxhLAlbqvYmSc0HiCSV4DLNdetqricaiG3Y49
	y8kK+vnzqrKPfVMq3nyrH06FMXvr5Id3cyvLwvk801bpSFtEmG0iEIxyMprJSOoZqdcg
	L04g==
X-Gm-Message-State: ALKqPwd2/q8XsOQ8A/IK/NjSoV40LlKZGwS6vAImgnws3Sidbccnw7XN
	cN6GZqw+C8n44H4QBlZoLuLulF8SFrafm75rmthDbQ==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr4182655oih.80.1527774188277; 
	Thu, 31 May 2018 06:43:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:42:47
	-0700 (PDT)
In-Reply-To: <e6827289-812c-eb87-ad52-43094917bb7f@redhat.com>
References: <1527663951-14552-1-git-send-email-zhaoshenglong@huawei.com>
	<e6827289-812c-eb87-ad52-43094917bb7f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 14:42:47 +0100
Message-ID: <CAFEAcA9dCysLQ6vm9WqB6pdrpiee-kVCgfbqqRy2S1nnpf+4Lg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] ARM: ACPI: Fix
 use-after-free due to memory realloc
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cyrY2ZAvSHvc

On 30 May 2018 at 10:03, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Shannon,
>
> On 05/30/2018 09:05 AM, Shannon Zhao wrote:
>> acpi_data_push uses g_array_set_size to resize the memory size. If there
>> is no enough contiguous memory, the address will be changed. So previous
>> pointer could not be used any more. It must update the pointer and use
>> the new one.
>>
>> Also, previous codes wrongly use le32 conversion of iort->node_offset
>> for subsequent computations that will result incorrect value if host is
>> not litlle endian. So use the non-converted one instead.
>>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
