Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp809999ejb;
        Thu, 19 Oct 2023 14:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGOyrbGfruyNsknRkTdtGyqJq3uHcLxIBjuxz2kcapVljC1y2Ek33B2ED4qRGOiHwKcwym
X-Received: by 2002:a05:622a:104b:b0:418:2b:acb2 with SMTP id f11-20020a05622a104b00b00418002bacb2mr3924018qte.30.1697751652721;
        Thu, 19 Oct 2023 14:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697751652; cv=none;
        d=google.com; s=arc-20160816;
        b=E8GQPpMpCfXM1vWWMcug7QyTpg2IIrBVQD+pExRmjDLhHBNbmHCE4N/bBT0SrLXhGk
         aSUTWEmeGTbb9LcG3mN1UGVyc8hjZRUedlNnDfToS4hFNTF8tPoKEJZJBfDpSND9sO8s
         pPbRKpb8tdWcA5CMBOphWmu+dkJf/uvvrRmPCatu1CyRbopLxRpMAHSvLqB3s4JwK6KK
         E5IzNBbLveR0AHUqrwJ1mJm+NS74EF5s9xgX29yd+WvFFHz7C7BWhcWkqBG2itfmkIe9
         sVW35eCn6xr6Yb0rsHZy+MMDrsqE6hHP5oivlRWkdJsm37qQ+AsbveGcZhPg4SA1twR2
         6g2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=AglSgmrC5Cex1SHGNjw5B6QcJrdmoSNmX5ne7OExsEQ=;
        fh=AqS06bBI2fiG66EUFW2L1h7q+nGqVsFELILF2r+ow1A=;
        b=U0OmFA1YMXMREjSvT1gs2dzk7KdEqG2f/yII5lv6AzYXAwDDo1bbBhMGBCq6bdnQG8
         wEfV8R7s0/Lh17WSJK45YminTJ0xDTdWg/oAQb70dm/XwpqMilsFGfESWZF5prDc43Zr
         Jcldj5sicZN2hkBMKlu7Ru35vkaiTlxXGbt2L6xaRvRy7qnFMsF3+XpMKlaWFfRBdI3p
         8+IWDxGzh1M2lHXtg0RBWiTC0BNafvncstl67Ajh8dLxVYlSlWFsYMgl+zixvgDzETBY
         oKbx5+kOQpAb/Qo4d/5dcRe/iXfH7eT6EG/2sb2MOPDyq4RiK1W7LChcJ7uSx+P7Ho3R
         A+gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020ac85b84000000b00410993e39e8si280875qta.260.2023.10.19.14.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtakU-0003Yb-OU; Thu, 19 Oct 2023 17:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1qtakT-0003Xo-Cz
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:40:09 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1qtakQ-0008QO-G7
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:40:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A5679203E7;
 Thu, 19 Oct 2023 21:40:00 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG6EX1.mxp5.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 19 Oct
 2023 23:39:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006070d8609-c87f-452f-983d-aa90b36fabe4,
 40A84FA1BFAB306571EA24E7D640879C68C08F1A) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 88.179.9.154
Date: Thu, 19 Oct 2023 23:39:58 +0200
From: Greg Kurz <groug@kaod.org>
To: Juan Quintela <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>,
 Nicholas Piggin <npiggin@gmail.com>, <qemu-s390x@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, "Eric
 Farman" <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>, "Harsh Prateek
 Bora" <harshpb@linux.ibm.com>, John Snow <jsnow@redhat.com>,
 <qemu-block@nongnu.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, =?UTF-8?B?TWFyYy1BbmRy?=
 =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, <qemu-arm@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Corey Minyard <minyard@acm.org>, Leonardo Bras <leobras@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Michael
 S. Tsirkin" <mst@redhat.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
Message-ID: <20231019233958.17abb488@bahia>
In-Reply-To: <20231019190831.20363-8-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG6EX1.mxp5.local
 (172.16.2.51)
X-Ovh-Tracer-GUID: 788fb555-ab1a-435b-9d14-6f76b08a239c
X-Ovh-Tracer-Id: 11686841037111007607
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrjeejgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtiedpkeekrddujeelrdelrdduheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhmshhtsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhthhhuthhhsehrvgguhhgrthdrtghomhdplhgvohgsrhgrshesrhgvughhrghtrdgtohhmpdhmihhnhigrrhgusegrtghmrdhorhhgpdhjrghsohifrghnghesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonh
 hgnhhurdhorhhgpdhsfiesfigvihhlnhgvthiirdguvgdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpfhgrrhhoshgrshesshhushgvrdguvgdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpshgrmhhuvghlrdhthhhisggruhhlthesvghnshdqlhihohhnrdhorhhgpdgtmhhinhihrghrugesmhhvihhsthgrrdgtohhmpdhkrhgrgigvlhesrhgvughhrghtrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhnphhighhgihhnsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpshhtvghfrghnsgeslhhinhhugidrvhhnvghtrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrgie
 srhgvughhrghtrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k8KxE3MPwZzB

On Thu, 19 Oct 2023 21:08:25 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Current code does:
> - register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
>   dependinfg on cpu number
> - for newer machines, it register vmstate_icp with "icp/server" name
>   and instance 0
> - now it unregisters "icp/server" for the 1st instance.
> 
> This is wrong at many levels:
> - we shouldn't have two VMSTATEDescriptions with the same name
> - In case this is the only solution that we can came with, it needs to
>   be:
>   * register pre_2_10_vmstate_dummy_icp
>   * unregister pre_2_10_vmstate_dummy_icp
>   * register real vmstate_icp
> 
> As the initialization of this machine is already complex enough, I
> need help from PPC maintainers to fix this.
> 
> Volunteers?
> 
> CC: Cedric Le Goater <clg@kaod.org>
> CC: Daniel Henrique Barboza <danielhb413@gmail.com>
> CC: David Gibson <david@gibson.dropbear.id.au>
> CC: Greg Kurz <groug@kaod.org>
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  hw/ppc/spapr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index cb840676d3..8531d13492 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -143,7 +143,12 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
>  }
>  
>  static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
> -    .name = "icp/server",
> +    /*
> +     * Hack ahead.  We can't have two devices with the same name and
> +     * instance id.  So I rename this to pass make check.
> +     * Real help from people who knows the hardware is needed.
> +     */
> +    .name = "pre-2.10-icp/server",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = pre_2_10_vmstate_dummy_icp_needed,

I guess this fix is acceptable as well and a lot simpler than
reverting the hack actually. Outcome is the same : drop
compat with pseries-2.9 and older.

Reviewed-by: Greg Kurz <groug@kaod.org>

-- 
Greg
