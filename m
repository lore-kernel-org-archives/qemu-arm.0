Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp739722wrq;
        Fri, 22 Jun 2018 04:55:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ29oq71kCJQgNwRC+voQMIkDoKejpS0Yoqtnz0pD/NPCqRnBt69PmDzDBvYTV0Q3m/NA7I
X-Received: by 2002:aed:29a1:: with SMTP id o30-v6mr1043247qtd.330.1529668501639;
        Fri, 22 Jun 2018 04:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529668501; cv=none;
        d=google.com; s=arc-20160816;
        b=kWx3Jw09q0kwucgLihT9v/WKuVp0ecmBp4xTqX0GNdVjhHAoUOhezf29jjzZTGHG19
         fh5KNPQ5ZzFVoJ9bigIQtB+xigzHWCGV0FnB2yFBtT5Onwslj9QjnJ/pEybNxcaSO0lP
         p2o1zkJoOAfEitznwnWzCLF97CtUuK3edQTPlxX48SFcn65kUEoI/VBI8wNQy8UmJhsy
         2y2CPG+qTxVdqlu6WoYalZTSbsq8w4dTeUDODkKNN6zbwMBfl04uQEyHp5XBxyWs45MR
         5UHH0aPL3ZiSP+kMaFrJjIHwggLgH8AaEl3Frd2jjMXz1w20/fIPkAta7YbEajskp6hK
         qNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=JlAowsxTxGoZ9bUWSjMZ42xodJOvI5/W6cRgthRcPQA=;
        b=w5txpMXY+hWV7QJatPJwOHbOKG+FqXwJuCoaS0fbZC7DOyOJfxiqUO0SfFmSAdmrwT
         4PYbVuzGVfJnZ1UphGzeJqZmcpr9/Pt4+LzDZaUXm1yGR7CSEZ3ghaq1A2wFLhqsKr/g
         861XQi7Hx5KC0d4Rf/nkzHldk+yf6M/U+SUMfa0L6hDsdQMCKR5pU0PekjcopWMKLltx
         BEPq7CCLvTz+tkgRHpNn5ByqhI4xQjnd1BGDZ0Df09F8sWbcYPUVNGLrs58mAvqL9sQo
         hl6Erp6N6Aefn6WM5KUzo/1u/Fy4VpWBCix+wNW+BG44ktGoUh/wSuBKjCfi8IBgj39m
         YMcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7-v6si7048595qki.107.2018.06.22.04.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 04:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWKeb-0004cF-3k
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 07:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWKeP-0004ZX-Fx
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWKeO-0004jA-NB
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 07:54:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36270 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWKeO-0004iv-Hc; Fri, 22 Jun 2018 07:54:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3F8C4059FFD;
	Fri, 22 Jun 2018 11:54:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDFE1C700;
	Fri, 22 Jun 2018 11:54:45 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1529326004-32239-1-git-send-email-eric.auger@redhat.com>
	<1529326004-32239-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9X2ASVtcG0Nw5_Bx-rn2+M5hW7g3+QhZvhASYn9aV+SA@mail.gmail.com>
	<418f7043-8f4f-3b04-f771-b9e392c64d00@redhat.com>
	<CAFEAcA_Kq1ABz1b03vHQQ_wO2G+HPOe6DkYjdA9mYAvzvowREQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d10437f0-1c39-48b8-243b-49c9f251e9d6@redhat.com>
Date: Fri, 22 Jun 2018 13:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Kq1ABz1b03vHQQ_wO2G+HPOe6DkYjdA9mYAvzvowREQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 22 Jun 2018 11:54:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 22 Jun 2018 11:54:47 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-TUID: +S0z79EJDTSa

Hi Peter,

On 06/22/2018 01:52 PM, Peter Maydell wrote:
> On 22 June 2018 at 12:48, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 06/22/2018 01:02 PM, Peter Maydell wrote:
>>> This removes all nodes named "memory" or "memory@*", rather than
>>> just the ones in the root, right?
>>
>> correct
>>
>>  Is that definitely what we want to
>>> do? The old code only deleted /memory, and the comment implies
>>> that we only look in the root.
>>>
>>> (I'm wondering if there are DTs that use memory nodes for random
>>> odd things other than system memory...)
>>
>> I don't know the exact use case. Removing the exact /memory@40000000
>> node is simpler and does not require 2/3 I think. So if this is what is
>> expected I can stick to that node.
> 
> Well, I think we should remove the wildcard /memory@*, but not
> /foo/bar/memory@xyz and other things that aren't in the root...
OK

Thanks

Eric
> 
> thanks
> -- PMM
> 
