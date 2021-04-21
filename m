Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp141513lfb;
        Tue, 20 Apr 2021 22:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXNOeFSI+pbiCP14o7q6cEHW/lBl0/1vvbH7DOkcG837xDzkDZhFfP2Nu/1HaPkFPJ/nO1
X-Received: by 2002:a37:c41:: with SMTP id 62mr19380644qkm.66.1618984414726;
        Tue, 20 Apr 2021 22:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618984414; cv=none;
        d=google.com; s=arc-20160816;
        b=TO+FdI7n6/APTlFhm+ZzLUTTnJoyUniBywA/J1TH8+AYql895F5/eSwG9xXVB/Oipl
         6Ko55NmgSVfxWUH6N8N3CF3fO++W6+hGQFqP4BDci53e304hJFvBW/rE/9VDSt1AfMiK
         EOdEyF0qcQdV7toLInO6wN22vCkf3/ecdyZD8Bjr/e7NB4VOwljJ61pElPxwp30kZ4gG
         OBNe67p6mdSrfWmTVbKv/hRypUxvTJJkJcqzDh/mLmQ2q5o8mwCXOxuwCxlc4Hu89Gc9
         XmrrK++nS2R8lnyadYRNNEMgINseAScn27nkj6obujrwS8+fuae1O447ADcU5/N5FuZR
         Ztww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=liWm7wyZoMBjUh+wLj7peqdJSpA80KX3CClfcFnsBx4=;
        b=A9OFVVW/cEeJ/met6W6sApGMJj/ZJCaKPbthNSYHHLB9BHt4rrjR6hc/8HLxnrWEY4
         7Tqac09IwvR8Leql05LOhmduS2Q9/Muly3LV4yNbMbnx4SzH3Rowf6Bm48kbY0PrtU9b
         ZWmS4Zv8KQdadHQLWbMKQO+ZB5ugkoGvnqaZjZVxl6rlqzS98s68DtbDSg7/RDKDAcjh
         V7wvye4jaywYxhHBIuOuUwM0GFK+K//1gnPB4ruPRN8yrD7YWpGfHPb0ftlaRRZavoye
         nyM9qTGMEaapHJ3jv691X93if09ErVTknNfUkt8J6LKhgDx6eSOXItO3HVI4ycxOv3ZV
         v2Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si926477qvb.179.2021.04.20.22.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 22:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ5nq-00082s-3Q
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 01:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lZ5nh-000824-O9; Wed, 21 Apr 2021 01:53:25 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:57849
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lZ5nf-0006DS-VV; Wed, 21 Apr 2021 01:53:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id A0178140180;
 Wed, 21 Apr 2021 05:53:11 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Apr
 2021 07:53:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006542725c2-c883-490c-9cca-65290617475c,
 3FD145AD23CDC28BEDADD0458B38E3079EC5C648) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2 01/11] hw/arm/aspeed: Do not directly map ram container
 onto main address bus
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
 <20210417103028.601124-2-f4bug@amsat.org> <20210420182819.GD4440@xz-x1>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1c21cbf3-c80b-4e65-485e-334ae84cefe0@kaod.org>
Date: Wed, 21 Apr 2021 07:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420182819.GD4440@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 61b27d41-c59b-40a7-9f65-98c2aa499aa5
X-Ovh-Tracer-Id: 13674898794892725237
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddtjedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrgiesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5VGXfhXQTOAU

On 4/20/21 8:28 PM, Peter Xu wrote:
> On Sat, Apr 17, 2021 at 12:30:18PM +0200, Philippe Mathieu-Daudé wrote:
>> The RAM container is exposed as an AddressSpace.
> 
> I didn't see where did ram_container got exposed as an address space.
> 
> I see it's added as one subregion of get_system_memory(), which looks okay? 
my version of this patch took a simpler approach. See below.

Thanks,

C.

--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,7 +327,7 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
                             &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
-                             OBJECT(&bmc->ram_container), &error_abort);
+                             OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot

