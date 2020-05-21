Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1599337lfb;
        Thu, 21 May 2020 07:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8TdM9p0WI1/1LzgadFdU0LeerwzWKcWmx7YT7ckbtedqVDYMMnZyfGPV1jvEhayryJY7d
X-Received: by 2002:a37:a2cd:: with SMTP id l196mr9798961qke.151.1590069943257;
        Thu, 21 May 2020 07:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590069943; cv=none;
        d=google.com; s=arc-20160816;
        b=KmGAqS6Mxi2VqI1uXWq+Ir/jqmha+njMzi5H3dsJFk6ESGluCXjih5DgPN64xkQLf5
         mVUoxYFJe9s2+D6VYuTwBttBgAxEyR6YsbIDEdfIkDlwe/jOzuOpWWjSHLVTf9zm0Pb/
         bGSUcLo9tod/yS09C17rzF7wnU4g1berPQXpfsK095gIaxCkihUcD7c6wypPueBZejPp
         8sJIul1DR/ecBS78DukYYKIPPr2DzX+4uznAuH1aytJiTT5EmK9dWSZGA3j1laJYRykX
         aLWSdnSOmBJsIynqtM+oaWJSuxjAh/D5xufYWQ3VMIYcTmSVhca5jocm5hLefl3PoBcl
         /tHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
        b=z+rJRU+Eh5rpMS/nyT0BC7TA0vHbq2+Fbrkmred40bAAxxljmmbT8T0PjpgowK2h8k
         DIBaMTdvuFirNQSpi0E7rtXkfQ94pXpQbhBNZVc/JqQ+53/mW+wUq4Kohq8BDLMw54oi
         gi0Pb6exEq4J7ywxtk0M1kd8hPDrh7g1svno0T5CoYtiws9FpXVy6OxEO9q6WXDaOEmZ
         rr1ybpGtv8I0P1V0FRZvCUK8l9yzZcoxpFfm8KzYyMN45hQEXMhSz5JSj33XDSmv6mPZ
         Xp0MHtdbFM65dLDWt0Q0u0qLMQ0+nWeZazWW3BrGmg69A8cjLfaIeZheUfKLY4V+8olD
         LIcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z4J/QTcm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si3311577qvz.198.2020.05.21.07.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 07:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z4J/QTcm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jblpO-0005Nz-NM
	for alex.bennee@linaro.org; Thu, 21 May 2020 10:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblpH-0005Le-GP
 for qemu-arm@nongnu.org; Thu, 21 May 2020 10:05:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblpG-0003NB-OF
 for qemu-arm@nongnu.org; Thu, 21 May 2020 10:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590069934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=Z4J/QTcm5NcDm1pvLzwbbMRN/amlTOaP/vGxSeqEiqY7s+YZ/niaGp4V6pRq1gV00Nrg9D
 aTiPQgQ1rTBsGP/g6+mGtgRwiZePf/v/be6DUvIMt/0o2D/uzf98dn+4jLn6i0vUUW5qzL
 /3Os2hx6bla9eawzngDIemhZvbCNR3U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-o5gyhff-OMi3F3I7SmU6yw-1; Thu, 21 May 2020 10:05:25 -0400
X-MC-Unique: o5gyhff-OMi3F3I7SmU6yw-1
Received: by mail-wr1-f69.google.com with SMTP id q13so2979500wrn.14
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 07:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=Bf6cQrlID/bh2FkjmBAiwRoXQ1DOQB2L3bKc2PdujMPd6BnIuR+403MXNUJTPdSUCl
 DbcnNdC25UjhrAgt3KLxb84kn0d2hSNA/U+eiT0SzQOeQ0wH1AeeWIla4pl4QcaS44cA
 cFIYSbUujbHn9QTQHvHmmnRspg1EJYDTUM6FvW33mwwxHsmLms0AEhP7F/J1Lr7WzD34
 DgnsgUuvKZ3XipVeSqLgCJfE0+5dhAUq6z+089QAETCjy7wjrmuuuqv0ma9mZx6Bq106
 y/wNRlthM2sa10HJxUMS7ruSLrXvxtomCZTSZfVa2RkPuO6tVMdYbRuNlRqZZ7oWJxA8
 N8OQ==
X-Gm-Message-State: AOAM533rjxS8HSmWaa1ZDDIe/122oU5RB02/fLwdUVC5eYzRVtyGRLBQ
 F+1kNh49bT7xKBbUfxlJV7KA9JWfUGWapI+3dJAjous2NufDB1bXXnWCqm38EszujzU4bMW8m6t
 49W03QzW5dk0G
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562708wmi.135.1590069920838; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562654wmi.135.1590069920578; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id c140sm6952309wmd.18.2020.05.21.07.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:05:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 <87k1187dbo.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ffae374d-9429-5bdc-d415-053aaa1b033c@redhat.com>
Date: Thu, 21 May 2020 16:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k1187dbo.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N8DC4e/rsORE

On 19/05/20 06:34, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>>>
>>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>>
>>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>>> Queued, thanks!
>>>>>
>>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>>> one, and I don't normally queue QOM patches :)
>>>>>
>>>>
>>>> I want to be again a QOM maintainer, but it's not the best time for me
>>>> to be one.  So thanks for picking up my slack.
>>>
>>> You're welcome :)
>>
>> Could you help me getting this patch merged ? :)
>>
>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.164861-1-clg@kaod.org/
> 
> I have more QOM patches in the pipe, and I may well post another QOM
> pull request while Paolo is busy with other stuff.  I'll consider
> including other QOM patches then.  Non-trivial ones need an R-by from
> Paolo, Daniel or Eduardo.

I queued Cedric's.

Paolo

