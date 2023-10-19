Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp780770ejb;
        Thu, 19 Oct 2023 13:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ3aFnSALaI/W/a5yCy226TBNbrDp0W4cJT4vh4923DKoexY1twaZnr9HpeskW8FxfHY6t
X-Received: by 2002:a9d:61d4:0:b0:6ce:2a70:c76c with SMTP id h20-20020a9d61d4000000b006ce2a70c76cmr2680170otk.23.1697748031095;
        Thu, 19 Oct 2023 13:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697748031; cv=none;
        d=google.com; s=arc-20160816;
        b=vNNfcn8kiEZCycCun32rF/QntiZdkgENZ1xq/Fw8bZpEFLoHFXDhSFoAEmKHncW7A6
         tFfP+Us506vhijojn/H9IFg1uVEsGMvG4fz1+2iWq5vzF+kKQlCa0zYf05yJC7K/8kb3
         d6RFhfxrOHEMkE0ehNEtAgBTMi+ZaBMiPeDvla2BL7ocznjIsQeZD24ZGulRCLOdbVH8
         yuOf9MowqzeGGh4tDzRO1PXVcjd1dTlciHEwu3FZMRAux8vACiovmE+AF4HkQtTGudf8
         hJo1dweXqapQbI6pXnjk6nZjc/OJz72jwR7Oc+CnNgs9SixUcHxeDcVFnK2QCv60/Hw3
         idHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=heJJusNNrKZY/OdJAnWgoVtwcCt2uR3jO3s3ZoRyvuw=;
        fh=nDcgOyJ5wI4ec5cBWrHogeHeYCn4pzALdxpM3FX1gnA=;
        b=gORepIYinVspknzUhod4Qz+hR2GTy9PSJA+aXkZ1uH6OPY+lkjjhomvXaoosiFM/3Q
         KNF+78jNRHbwJuSIWqraFGU7rYgrpO4KVPEyoDmaps8CukFAo1n4ET3bBNyDydXr3R6h
         mAmGoK9Pv/NNr+S4IJLzHY5V43X/E6vXIovs2vWiyoKqA3fOZnCBysy8oejCXScKTJDH
         /TD0E4qXteVIWwcngAuDDdxXrzDF3DV6cH/XrwyGDqdUFwD6q0bVBZ/h08MBpK61aQB8
         B4RXvUUu12SQqvDIlcCElzuYStlLvc/MnsGxxpwMFwm3PHC3ULCWg6gO6Q15wfWNO53n
         MNRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IeBf2srC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if5-20020a0562141c4500b0066d12b4f281si312399qvb.477.2023.10.19.13.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 13:40:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IeBf2srC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtZo5-0007SK-Go; Thu, 19 Oct 2023 16:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qtZo4-0007RY-0E; Thu, 19 Oct 2023 16:39:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qtZo1-0007rU-Sr; Thu, 19 Oct 2023 16:39:47 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKbNol026661; Thu, 19 Oct 2023 20:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=heJJusNNrKZY/OdJAnWgoVtwcCt2uR3jO3s3ZoRyvuw=;
 b=IeBf2srCGmFVSZBZendS2Nn3wP/58CQxBEJVzM7g5ESuNE4ke0CfDZUsX1xbyTUf+fXh
 HujsN0d86kpXjRGY7Bg5S1cBlEji8ewL5EZbLSNCbaLjDZBCgjDoKf5RXiAuZzr2usdE
 o+5fwpKuv4aZMyVE+M5kZK/lEJEt/muQQRA7+MiaYeTcFveOnMFsMBw93Ij98uR1/eLN
 H0aiZVXsGQYGV9XjOLe0B7yHx5GxwSRsDylmHk16eKrlMhnGr7ivHKYBghmYtTtC4Ysr
 YVJz+yICpPKeca3swdG0A4SwCYGVj3FTDFV1b7SfttjbDaQIl40uroWPJ0TWym+wMrQy hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubne04j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:29 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JKd80u006845;
 Thu, 19 Oct 2023 20:39:29 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubne04g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JI3EqR026870; Thu, 19 Oct 2023 20:39:27 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5asuqeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:39:27 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39JKdQPJ10420780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:39:26 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7772158057;
 Thu, 19 Oct 2023 20:39:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2625D58058;
 Thu, 19 Oct 2023 20:39:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Oct 2023 20:39:24 +0000 (GMT)
Message-ID: <fd756df9-12f9-a6d6-e6ff-1e8515a59783@linux.ibm.com>
Date: Thu, 19 Oct 2023 16:39:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/13] migration: Use vmstate_register_any() for audio
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Corey Minyard <minyard@acm.org>,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-12-quintela@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20231019190831.20363-12-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vQ3v0F1meH4_0p848xy6h_PeLD_gy7d8
X-Proofpoint-GUID: 8ZeNpZBFDGTIdq-B57QCFcYB9Jq64DKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190176
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xK4rtIndoKOj


On 10/19/23 15:08, Juan Quintela wrote:
> We can have more than one audio card.
>
> void audio_init_audiodevs(void)
> {
>      AudiodevListEntry *e;
>
>      QSIMPLEQ_FOREACH(e, &audiodevs, next) {
>          audio_init(e->dev, &error_fatal);
>      }
> }
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   audio/audio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index e9815d6812..f91e05b72c 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1781,7 +1781,7 @@ static AudioState *audio_init(Audiodev *dev, Error **errp)
>
>       QTAILQ_INSERT_TAIL(&audio_states, s, list);
>       QLIST_INIT (&s->card_head);
> -    vmstate_register (NULL, 0, &vmstate_audio, s);
> +    vmstate_register_any(NULL, &vmstate_audio, s);
>       return s;
>
>   out:
