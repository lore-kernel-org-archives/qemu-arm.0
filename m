Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp738247wrq;
        Fri, 22 Jun 2018 04:53:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ3DWZZD4SuUeJxbz9LF5JNwbnGU8cEW5+cAXBY+YAmB8/g17tLrMA9IMClC+kPnc1cY2GP
X-Received: by 2002:aed:23d8:: with SMTP id k24-v6mr1011010qtc.255.1529668401493;
        Fri, 22 Jun 2018 04:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529668401; cv=none;
        d=google.com; s=arc-20160816;
        b=LpFFOSVNYqqgjUl0UaRbbirv8+aLQkjcCaukHGdoBbqAWyCGsxCRD6VKIAHFVdbCsM
         Ty7lA/qfhNiIXEMYIlF0Ki9LIL1G8yAuxwqcxTHciTpkg2xGLxe7fPpX1F7r+u8M8k0F
         3U2qke67PrMxeOsZT7h7vifuljdC5BxhMwatfjTTUXXicqLc88OPX5DK845GePwgCi0F
         sSfI8+Mp9by/dcAc45PMuXzNRazd38PEBVR85A6bsxqKe4mWBCMh0tNyYKSzc20ID6mh
         +YDqNcWbLnut4T7JYe5RkiryC5K1C8O4b/7U/ROJUx3gaqBSr2w68ryFmGu6VF7tvl0Y
         AW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0Liev2fU0uht2RwJb4aijCXh49VUyyrzkhe0GSS4H6Q=;
        b=H/+F3ybb8wSG/mbT3/SRjdZW4FTJygku/TvYLc6+hApytH4MkwBO1sH5edylZNSkLc
         HQmsT0q49LvnIAyHVkQzlHWjTXuKrLghAC/w7OfWRfBX48mMZ9hsA1sCk0jMVz0HycyX
         zZKaRqs1a1LK1g4U0ij3Jq/FlMhRY0fUt9YUvS23dBYRBF4wYUDtQSvnp5SW9zndHuLa
         BmOrazroVV4f43q+DUaoS9WHXaXI9KvWYY+Qo8D3Ml2Jr0hwbbolOBnUKEZy5PwYL681
         BQKh2oTufKQucATs7kx7Y6X5XxL9WWYJnPTh+o75W+Hj0R7iQ5GbHxGN6Z4fx6Dv2zDF
         +Evg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1R60tEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si524245qkd.91.2018.06.22.04.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 04:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1R60tEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWKcz-0003T9-2d
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 07:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWKco-0003Re-AO
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fWKcn-00041R-Ns
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:53:10 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:43656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fWKcn-000413-Gk
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:53:09 -0400
Received: by mail-oi0-x236.google.com with SMTP id t133-v6so5861875oif.10
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Liev2fU0uht2RwJb4aijCXh49VUyyrzkhe0GSS4H6Q=;
	b=d1R60tEb907Jka0teIudofV++v0fQctixUXYrob2q6u1k8ZYBxMevR6pNVZzK7xx7E
	d8Rhctqd7ompOj8MJkIsc0S7v8u1g9yUdrkfgw3zXtXx8FrpXEewQhpOVkQ20hAxO/qb
	9M0VuDPMeUm8e3Cnk7gsVmHC5pjgShjZqHlik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Liev2fU0uht2RwJb4aijCXh49VUyyrzkhe0GSS4H6Q=;
	b=SJhxkAJBvjVCGE0jgbJAOTVd/XiY62SIkbdMJ9/hIiG3+8arPYcObSOdw3C3ZLkRQO
	FoV/u+iug7GeAieQTrMK+5dVVYBk7SUQyYCSyFThFi9wSHD2tzxJyflEsEwpOsyp8HZN
	0F02bJNGIYrOg0wqbtXbqbkjqGxINubA+7DH28dwR2Y6nwvspPOvdV0+uYaaF2Vpjw/V
	3s8QN9JuheTylXt1jCmthbU//Sf4wy4ho3/LYRG5XRED8hHBrgUwVXQNvZ4DaDI93ErA
	AogUrOgTGbjRN52hJW0j1FpdyhsTqKUYtp+XKRovT+nndAMFb5oZ+Hbftc/z1AvwK+0P
	uNcA==
X-Gm-Message-State: APt69E0QjNIrg5nl2KnbQdslHGUxZTZ8g3TrM5ahFV1809WT4NsXRv9v
	0BmTwsPp3Z/GuJrKPhaRaZJgIdfUEVOSkh8ag6Id8w==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr704299oib.252.1529668388736; 
	Fri, 22 Jun 2018 04:53:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 04:52:48
	-0700 (PDT)
In-Reply-To: <418f7043-8f4f-3b04-f771-b9e392c64d00@redhat.com>
References: <1529326004-32239-1-git-send-email-eric.auger@redhat.com>
	<1529326004-32239-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9X2ASVtcG0Nw5_Bx-rn2+M5hW7g3+QhZvhASYn9aV+SA@mail.gmail.com>
	<418f7043-8f4f-3b04-f771-b9e392c64d00@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jun 2018 12:52:48 +0100
Message-ID: <CAFEAcA_Kq1ABz1b03vHQQ_wO2G+HPOe6DkYjdA9mYAvzvowREQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] hw/arm/virt: Silence dtc
 /memory warning
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>, Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+w49fns6qu9

On 22 June 2018 at 12:48, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/22/2018 01:02 PM, Peter Maydell wrote:
>> This removes all nodes named "memory" or "memory@*", rather than
>> just the ones in the root, right?
>
> correct
>
>  Is that definitely what we want to
>> do? The old code only deleted /memory, and the comment implies
>> that we only look in the root.
>>
>> (I'm wondering if there are DTs that use memory nodes for random
>> odd things other than system memory...)
>
> I don't know the exact use case. Removing the exact /memory@40000000
> node is simpler and does not require 2/3 I think. So if this is what is
> expected I can stick to that node.

Well, I think we should remove the wildcard /memory@*, but not
/foo/bar/memory@xyz and other things that aren't in the root...

thanks
-- PMM
