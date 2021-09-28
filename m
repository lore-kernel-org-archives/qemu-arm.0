Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4746453lfp;
        Tue, 28 Sep 2021 03:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1mvZ2v6D46eK9WUTfH2aVXRbGI/rrquPPO2CCknPGl329kQHEhYmSOZHVQLKoRAU1+5jF
X-Received: by 2002:a05:6638:2385:: with SMTP id q5mr4082715jat.5.1632826382074;
        Tue, 28 Sep 2021 03:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826382; cv=none;
        d=google.com; s=arc-20160816;
        b=BkGcifkvqPTz+y+/CZVxqRkl1qtnCORKX5t12xiRRy42VWJGeuTtM+5xd/vhZDEtLZ
         8RX+0PmnQLchyr6QJLSvLvHqwmKeiR5mK1SQ9mpPk1T41LA3rWMJIZnTZy+2G+cfb407
         oZz/ufC7CcYRJ0bUwui4r13K0Jt3LgLQwVSyAtLe+pLVE5CcgsSXuaUJNOxJ+gt24Oyf
         5mpBBmfjGzjZtA/TY1AmJBn4iYRUmZgnSsZr8lVNStC93qUIrtDrqLaAq6WjB5g/YekZ
         t71Ef1+vIOz5dwmnZBd7ziCWgujLEy2AT7qww6QRaFVchR/RzN2Dxk8sFDwJkMRA9Cq/
         jsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Q1cKMhi20Mg2NFvMjpR8tbzd2I3iL4g8r9r22jkQTDM=;
        b=eK6sw30QfQbKMLXH4A5r9JYcWAPiLa1/b8H9Ke7hYEq/xTwZ9DYzSuaHyWGgvV9mPP
         KyG7ITcBCgmfkUXpF0T3gRHpj1dSnui781Us+hqId/SJTB1adA8D7wc/SGxlapRE0mPg
         lO9LEL70IGvp5UrZqEHJsHc278+r7g69rlyJ7Ke+sC3tTnF9D+dQgR+L9zfstusaKUbf
         jjB0xDjpScQ9UPiFE3/HA8bIGlnLWYTOSUTPHAHSGl1sMgLMpupUcWU99I5ZNUX9K1WB
         mprvNTUpRJD1/VC94vUbBdxp3c1iZ+hOeOORWHnRvSq2TEnH6tOhpL0UnMQFHDheV7uH
         KsLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dpa914Vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22si12028179jam.46.2021.09.28.03.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dpa914Vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAjN-0000ew-Dr
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAjA-0000cQ-QF
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAj9-0003MD-8o
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1cKMhi20Mg2NFvMjpR8tbzd2I3iL4g8r9r22jkQTDM=;
 b=Dpa914VxUKRCZ0ViqT+/XUP5AeqB6/kwC+BAyrd8dAt5Da+1SckWhgSxIcIAlWlyULc64K
 uU/LaiwfxD+UQunNLJLD0aXQ5Qws8EZYMbSM++ONB4QSi3O/2iQ19gAkesriK7Dtga1oI7
 AnPbqhAQY82IKX6uDUCOb7J72dM1zh4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-or22U679Oh6o_TptuuJK7w-1; Tue, 28 Sep 2021 06:52:45 -0400
X-MC-Unique: or22U679Oh6o_TptuuJK7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so14997718wrd.11
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 03:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q1cKMhi20Mg2NFvMjpR8tbzd2I3iL4g8r9r22jkQTDM=;
 b=ejYUkVdRKq6fSlNN4+gzqDLWC9dJ6dNGfNkqhpQvGZLcMdIUeSXSE5ma89LP4INlbT
 MT9I/vPjPHzsg0c7g6FDuROKQoJLUfMT6cSFvtVGEn3QGhktESi7H6T0LI0ZYQMJAaac
 oq4ZidSLUK1dJ0ov6YdO11jcExXV1GUIoYUOaL27V/IIkjWlsu0KEzAajEpdvie7SuY+
 Gv06Z9tUESMgTKUSHgyS+UG8wzbeqQBZvKtg4bfICjwJ1R0PtPXy06KgP3dFQlcTUUXd
 Yr/KCY+xsVNmJq0+XUEw7Vuy//cmOZEvPJsSJZHzQHupAhSYNiJRLSbnD5BKQllwnUqm
 kpTQ==
X-Gm-Message-State: AOAM530b4qxKdLfK6XLHR+E/PRAt8N+9g7dWxps3soMer7ab1soeTsdG
 HXLL6CPCE59pLdk0e2LO8duWCzpBbB1+kShmZ4PMu8hA7bhAnhrWXe5i2BgaMDPSYkzEk2zxj76
 AXdXUTeJG8mtc
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr3924436wmk.5.1632826364295;
 Tue, 28 Sep 2021 03:52:44 -0700 (PDT)
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr3924417wmk.5.1632826364097;
 Tue, 28 Sep 2021 03:52:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o5sm8046262wrf.85.2021.09.28.03.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:52:43 -0700 (PDT)
Message-ID: <993caafe-76fd-6f36-1570-14875a97e84c@redhat.com>
Date: Tue, 28 Sep 2021 12:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 09/14] machine: Use ms instead of global
 current_machine in sanity-check
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-10-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-10-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1GbPzIwU/0t7

On 9/28/21 05:57, Yanan Wang wrote:
> In the sanity-check of smp_cpus and max_cpus against mc in function
> machine_set_smp(), we are now using ms->smp.max_cpus for the check
> but using current_machine->smp.max_cpus in the error message.
> Tweak this by uniformly using the local ms.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

