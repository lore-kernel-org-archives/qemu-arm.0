Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp525307wrv;
        Fri, 2 Aug 2019 00:51:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0ypoz5rHgHnmEIr/rC7TEpq72F81rXIGKocEJ2t301ayvPIY7aC62v3C0dX5QSqLE0ooa
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr22881585vsp.163.1564732272224;
        Fri, 02 Aug 2019 00:51:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564732272; cv=pass;
        d=google.com; s=arc-20160816;
        b=gRgDPRXwafT7Tkow/Y8tv3trBJ6LCSB3OfQcJazhnuUnubiuBXHxzadD5ZIMax6Txv
         HuWiq+PUZkXG3wFbylyLla019keoNzJKRK3tfIN00Cp/8yu9oDCbbjG3kl2zXD4Y3IG1
         AUfL44iql8vYyNoyXQ6Q5xLy+6EwPqJ5AjATJmO3gnBn/E0HO0rXu6NIKPhD+4FIbbq/
         m9u77VupHMbjIm0sIIJhuoXrQdWdarXpaCW9JSV5hGyXztF/mILqN014B2zJ1vyvZVYX
         4mAh/C28LTw/XW0AttUbmjLliYRJTT96PsVqEEy6ABtJCmuJ1AGdbWhRuYRD28iXe3/B
         hq2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=v5JXYGFw0SrkNdhYWhkbF5nQDgnrRl/1ad5g55DAqfU=;
        b=eI/2K5CmS5+6ZFs3N4/IGVuV0eneS+EzNcDNL3Sja1l53+rpwSWDrG6nJlxQyARrTo
         cxFy9soxfZPajmgEjlC66Cnnr7Ij3/CWCh8CjPmhTgoAOFZO1ZIDcZk+YXq+1Y4ePkCD
         Dr0kZX8mTML3OwnZKyrKu+Wysgu4UrML0ncJUxqC839/NiX289EdCBT0zOx6EVx9y2l3
         g8gskRA8scsXqYMANcOiDasrWm2pTNrDQIiADHVI9LQM4sAMV6c2DkPhSydaRH2oQCYy
         FRt11ppJ6/HerU6qKDjOl0iCWDqkW6WTjqVkl4nyqWPWKN2lZynt4IUOp2O847H5Sa2q
         Rp1A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=icEkShbJ;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id s202si16708787vks.58.2019.08.02.00.51.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2019 00:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=icEkShbJ;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.117] (unknown [172.16.11.117])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 3B83096F50;
	Fri,  2 Aug 2019 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1564732269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5JXYGFw0SrkNdhYWhkbF5nQDgnrRl/1ad5g55DAqfU=;
	b=icEkShbJ+BtVXi+xWe8U3asaCRCoqwSEpDsW86i7/d6OvOXfc814QgE0bX2yrR5MXEA9xb
	fhYJAwVhXRWkbH99S+zVO7ioLv1eYjpLwREspIOtDrWi+wrP9yps6ty35jpYYQbUya/Uj8
	SE2IZYYz7kwWlFRmgOoQ9sybtYrJOHo=
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Avoid bogus NSACR traps
 on M-profile without Security Extension
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20190801105742.20036-1-peter.maydell@linaro.org>
 <af347b17-b524-1075-d462-2b0e6eef41a5@greensocs.com>
 <CAFEAcA87XdDJH5TO-AiDfSqudmwzuY0yoa0H60objxXp3Bh9LA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <569b96b1-e11a-59c5-4f67-1da2d592b8fc@greensocs.com>
Date: Fri, 2 Aug 2019 09:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87XdDJH5TO-AiDfSqudmwzuY0yoa0H60objxXp3Bh9LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1564732269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5JXYGFw0SrkNdhYWhkbF5nQDgnrRl/1ad5g55DAqfU=;
	b=CCX5KgZFNQ5uuMfb0M85LyFvy6KHZd1IzKZxczqavDzp5VaGuTooZh4HAni4ziQzSVRhjn
	bwOE21kFDyZam0K7iFpvnIDknLJpCMQmNqYOsElt5B6d7v0av6h2ZOcag4TUix4snqBNlZ
	vcGdo6fX8YeoqXSPeF2rFptWczsQtWU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564732269; a=rsa-sha256;
	cv=none;
	b=iaKoeFsU6/PNB5qBJi81Pzop+eWfGeZV6fqYBIkCz9LPSgQTQSlr3XxL6JfbIWjR+6wZMM
	NXwY/lLpCYLHAjheINP9130n0RdxrAYnfR+Z8XvA9RQv1QG4JQThknIKbMpbk7YELcSiZp
	WyhzIDHIgZJhveRIF7uu5DEbk/OeT/c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: 2ADMj2qD7sy8


On 8/1/19 4:38 PM, Peter Maydell wrote:
> On Thu, 1 Aug 2019 at 15:20, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>> On 8/1/19 12:57 PM, Peter Maydell wrote:
>>> In Arm v8.0 M-profile CPUs without the Security Extension and also in
>>> v7M CPUs, there is no NSACR register. However, the code we have to handle
>>> the FPU does not always check whether the ARM_FEATURE_M_SECURITY bit
>>> is set before testing whether env->v7m.nsacr permits access to the
>>> FPU. This means that for a CPU with an FPU but without the Security
>>> Extension we would always take a bogus fault when trying to stack
>>> the FPU registers on an exception entry.
>>>
>>> We could fix this by adding extra feature bit checks for all uses,
>>> but it is simpler to just make the internal value of nsacr 0x3ff
>>
>> s/0x3ff/0xcff/ I think, given you put 0xcff after and in the code
> 
> Yes, 0xcff is correct and the commit message is wrong. (Bits 8 and 9
> of the NSACR are RES0 in all situations.)
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
