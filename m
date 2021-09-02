Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp439376lfb;
        Thu, 2 Sep 2021 09:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiXCC0gy4IcXAHBYlc03hEUfrl/SfdEkZDGtSw8DmPaN72OTns7r5KMx6UVIV0GkUHUKo0
X-Received: by 2002:a05:6102:3f50:: with SMTP id l16mr3159761vsv.10.1630600789356;
        Thu, 02 Sep 2021 09:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630600789; cv=none;
        d=google.com; s=arc-20160816;
        b=0EXNUrEx676U/cQLVFISqjO1CJjGD2z20tWDNWm1wRaYLn0b/pF5J661m3KgG7QMKG
         Thx0mMXmid0Cz3i6qP4HVj9xyHZZXCEEvj0QMvyF29wdrt8+Vmrg/F+utptQSgvWC3Sr
         LOh5dUiYVWsRgPVjbkRN4FVM1DLSrsFWH+P98ioBWFH5Ew8GSq1JaZ7UlrbGqR3MAYMh
         5J8BS8NMTcvDsHhwQ312udX7ZZIAxu1jkq/ENAk4sTlC9Ak4PJNU+Nh650CVxHfXdStg
         wNTNuuYVBxNB1XUXairdtPQvd1j2nUe3YdVZoyNKOTIIltPc4xPajLpZ4N1+Elw0B7vI
         9o6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Pr4ZkaZw42x/SdXedLhP/x9K5O0y/9HqjKm3I3DMZqM=;
        b=wb50GMo4wzi0m4cAzdBGmYBbi92bxQWxbSbkI5I2SgJR7Cx2JI+0e70Dq3nCFrlOXK
         EvOupYh7PUQVM7iYZtx5h7We4ki8iyim+rU2BopCAq1SwL7c2fiBb5cj7nC9TGvFfdH2
         Nmlc5UKUYO6PlSAdR6UAVbsQYkSZXXQ+2i/+rg8Hmq6gWIdkELXV9+2WVdAy74FaomAN
         suxkrVnWg1yHDmUQYNZrnbjf/l3go0Qlie3XxnW+3qvsK6f44svdQflVRLdfL8mvHtZj
         eA/mu/NKCQ/xpsE5WOhx4moBSCTsqJNLRFHut4o6ielLzlt+YxMW2bKBRoEpS9sVvLTd
         eqdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si1194987vso.140.2021.09.02.09.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 09:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLpki-0002dg-NE
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 12:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLpYu-0005Jv-Ma
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:27:36 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:52525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLpYs-00033i-RA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:27:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id CE56528FA89;
 Thu,  2 Sep 2021 18:27:31 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 18:27:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00226a1300e-2b42-4499-b5a2-c0be93a240f8,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
To: Patrick Williams <patrick@stwcx.xyz>
References: <20210901225946.500125-1-pdel@fb.com>
 <60994ebb-d345-cc40-020e-2c14ed438097@kaod.org>
 <0B35613A-4001-4E31-A522-ECF827CF1F8E@fb.com> <YTDx5fyuHmylObg8@heinlein>
 <73962d5d-ddf8-77b5-f4e0-7d3fad9abd71@kaod.org> <YTD6iHrHqe5YAjyq@heinlein>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <95cef974-719b-1e44-14ab-da20b9e48e65@kaod.org>
Date: Thu, 2 Sep 2021 18:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTD6iHrHqe5YAjyq@heinlein>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11e1a14f-0ad2-430e-848c-1801e9951597
X-Ovh-Tracer-Id: 18118825728622300012
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0BkdwSNRuxAt

On 9/2/21 6:23 PM, Patrick Williams wrote:
> On Thu, Sep 02, 2021 at 06:19:53PM +0200, Cédric Le Goater wrote:
>> On 9/2/21 5:46 PM, Patrick Williams wrote:
>>> On Thu, Sep 02, 2021 at 03:12:12PM +0000, Peter Delevoryas wrote:
>  
>> The pca954x muxes are supported and these devices : 
> 
> Oh!  Is that support relatively new? 

Yes. Patrick did it ~6 months ago.

> It was probably a year ago that I added  the Sonora Pass system.

You can add more devices now :) 

C. 

