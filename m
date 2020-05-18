Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3033220lfb;
        Mon, 18 May 2020 06:23:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN2mncStO+PjW8tO+2KE6zzy/Eiuo/vow+SH2iGW691RpN6Ko9GpE3ss42+SEZtU7EAGpx
X-Received: by 2002:ac8:4a88:: with SMTP id l8mr15768264qtq.337.1589808219576;
        Mon, 18 May 2020 06:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589808219; cv=none;
        d=google.com; s=arc-20160816;
        b=e/t1wVQuZLnlAibHZE+xL8traTvBOi7mgW9LI/8lVXCcpMciC+93klgadfJPp/UiA2
         E01MXBtazcx2QOzBE6qCYpEEgIWtuyHhtWJRBz3/Zd7rdircxlPVgRKvFTZiBA4XOYh6
         lYdL7o+4lkFBJSwmY6s6PYeAMqIITyWizolsC3D5XFJckBYv6tTDr02+QXeJSqtjLFHy
         pMiHgoT8LNi/hy8FJ7rRNfRyTj+MK3dlCQWupGicvKRuQk0hqr16SEnMt+bi3Br+HbWA
         bAMCOqh9Vnr7DepSCldvHEvxNkcZx8gzKpvYVnu3106o6YfPHldQJyPLSqQGOMqBxo9+
         2xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=UMgVSi6dDNK72M34wxxIYPx+wupwuSXKlObAf9CJqas=;
        b=S6CtTjGyI6e7I24s2taRB7ds7juRnbWeA5ITUkITxraHhF5suRv8tAWoPTdqfWU2WM
         /Q/MdhA3ZrCjq4QS5RLf3W8eSkP/xUou7z3IDy22xCIYWZOlc5LRF7ue5/lAo2+u85xF
         MUVqu2VaAdk4HLDT5aU0keM+LBbAHM5kzC2WI5rFOlO1S0H3GkX9mktj3LhMXbc9EREc
         AClortS8DnSLEZwVK7ZvLpFJzI3lSX61OHrxFxBGX0wVKpy8y0Hhg6J86wvltpffr1bL
         7UwTqo4ekaGJBvX2MLBl8FrD4fiZfeDCxPWWUlHSsxxKL2dWmIC8ozGZETPKQUrj62qI
         lwXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si6069533qtb.164.2020.05.18.06.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 06:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jafk3-0004G2-25
	for alex.bennee@linaro.org; Mon, 18 May 2020 09:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jafj4-0003I8-2s
 for qemu-devel@nongnu.org; Mon, 18 May 2020 09:22:38 -0400
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jafj2-0007YF-Hp
 for qemu-devel@nongnu.org; Mon, 18 May 2020 09:22:37 -0400
Received: from player732.ha.ovh.net (unknown [10.108.54.59])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 024018EAFB
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 15:22:33 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id D7420125CCEDC;
 Mon, 18 May 2020 13:21:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b3c596e5-fc65-4a7f-a892-87f5b49a92ea,2E2A9519E3FAC9D985F861812C9F86F7BE89492F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
Date: Mon, 18 May 2020 15:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87imgt9ycp.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10095100040702757704
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffhfffudegjeeggedugeefgeeifffhueethefhfeekkedvkefggfelteefuddvteenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.52.203; envelope-from=clg@kaod.org;
 helo=3.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 09:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JkwIr6LVUr8i

On 5/18/20 3:17 PM, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 15/05/20 07:58, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>
>>>> Remove unnecessary casts using coccinelle scripts.
>>>>
>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>> Queued, thanks!
>>>
>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>> one, and I don't normally queue QOM patches :)
>>>
>>
>> I want to be again a QOM maintainer, but it's not the best time for me
>> to be one.  So thanks for picking up my slack.
> 
> You're welcome :)

Could you help me getting this patch merged ? :)

http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.164861-1-clg@kaod.org/

Thanks,

C. 
