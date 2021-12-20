Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1206352lfb;
        Mon, 20 Dec 2021 09:22:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK68/51ceBKLsaMgn9YI8wjbkJsr2jhhHICN+1xVOBSB4h9l8gjkNhdvp3ss69B477qWU7
X-Received: by 2002:a05:622a:151:: with SMTP id v17mr2147950qtw.167.1640020932329;
        Mon, 20 Dec 2021 09:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640020932; cv=none;
        d=google.com; s=arc-20160816;
        b=SRy/4wBYbJ0itUTc+BGtAyW4MPpQFWxcTCWbThcV74jcn87G28GD4hSOqvL8Ihmit9
         QgV3g6SYXGPrr8yBmsH6o+pys04yj7WdSD6L/xUJRefvNI+/eUfSF8djLYPwuTanS2AW
         HnbzkWE+KDRdLjBiJNK1Up5xVJjXLIrsICnREmdUpdwEcZIKOZ25ainAp+RK4hrPX9S4
         xa33BTqKtCs+MbAneCbyHyugx1QKGb9+tFe2H9B7c0whnWCAs05FINLef6LJIJat5O0L
         nEI+ALpaA4TTp0n1jjthYTIxibrrYheX2SNKnjpJzzssmnNFE3jld2i+m5oSWog9zu8p
         8iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PK6CqLqNO44fjRxA0cdMixayW1tdGf2LpNBIt9XXOww=;
        b=lxgdLYDagd4ndnWZ7zhzP3q3FIyu/ZAIaf1ldtFlpCyHZnQCLFLzbaSkavQD4bxOzG
         dchTdTTj5yQLeuWX+2AflVRNrQDuYOTgE4r8/ZujJHvc9qg4m5I44Lz0Cu11uaLa3O+8
         FRNlltRblf+nmVp+/uCpjejkTxau7DH6OOZUS5hienY6FqTpoAyHQ4zqYuiaTY2tX+Re
         dxKH6sT4M72hbniptWf8XKVtYueiyuvIQKnDiltzOYLebC9RxGQ6+kKRju4tTEtwyPK9
         wq3mvvlggXhq6n6eXW9sppccFg9i45/SIqAo2SH164OPmN1Q+8LyooHQfmqboohNEs+g
         vBbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ISiSkncB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu13si7341415qvb.9.2021.12.20.09.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Dec 2021 09:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ISiSkncB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mzMMU-0002pT-NT
	for alex.bennee@linaro.org; Mon, 20 Dec 2021 12:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKxI-0002Rt-Ig
 for qemu-arm@nongnu.org; Mon, 20 Dec 2021 10:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKxG-0004o1-Ts
 for qemu-arm@nongnu.org; Mon, 20 Dec 2021 10:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PK6CqLqNO44fjRxA0cdMixayW1tdGf2LpNBIt9XXOww=;
 b=ISiSkncBU6aoeduINbdEDV9+vGdbERcj7PqVyLY0YEzk/NKBCdvBBLlD93jzQeXPelpN6C
 wbZN9gB0gm58v4DoC+tVoA7mZUckXQkX3woYF+/uzZiFAk+/CloivyqzgXJL3hlyqhmTQg
 KkGV+6gDJOu7FBbqXxSH1otzFO4rzzc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-ijp_RbTgNPak-vijpQzUHA-1; Mon, 20 Dec 2021 02:26:36 -0500
X-MC-Unique: ijp_RbTgNPak-vijpQzUHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso3419359wrd.4
 for <qemu-arm@nongnu.org>; Sun, 19 Dec 2021 23:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=PK6CqLqNO44fjRxA0cdMixayW1tdGf2LpNBIt9XXOww=;
 b=xP2z2ItejXdghEW+nHRuyn/C/iFchxKyDPG6Ys9MgC/bA7VnbvWl3zOIYHEn4Mf+qM
 gAXTlr7SkRlZK2AM7rCjUu5aWBehf1cDv2cYboVCzpe0mSq2MEnPnIxhAvCKJ88S/KQB
 FsPF59tFvkCELipJE4KThwcMZatxH64JElH+tvN2znWzmEfvukOdmL6YOBlmEX+TlauI
 G08tFqAfBLu02rx/phogvrF/z1vLP4n4E5l4c1hrNjGvp+srKYEmtNaXDfYKeL480zPX
 /t26EwUEhPsgySLxBWDZq1p74xrw2xGi38zbzYgeVz+FYUi1bRxdMDkBCExu5Dod+svY
 fjvQ==
X-Gm-Message-State: AOAM530VTr2CNiioLQNUUqm7pArirqebJH82/F8kX627BynAV0jKvyq3
 1U4uzFO588N+nrIpzM9VS2YkE9TV7xYsdOxcUEhBACuHQwn87GnUkhdLqIzGn1H7CjiGjiVsL3j
 ZhulHyPXyD5Xr
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr1467098wri.420.1639985195650; 
 Sun, 19 Dec 2021 23:26:35 -0800 (PST)
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr1466954wri.420.1639985192317; 
 Sun, 19 Dec 2021 23:26:32 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d2sm14593496wra.61.2021.12.19.23.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:26:31 -0800 (PST)
Message-ID: <4dfc91ff-1835-e796-772c-0774e089b57b@redhat.com>
Date: Mon, 20 Dec 2021 08:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: build qemu on Monterey?
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2112182006430.46303@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmI/PzvXbc21

On 18/12/2021 15.38, Ani Sinha wrote:
> Hi :
> Has anyone tried this? Yes, I know about
> https://wiki.qemu.org/Hosts/Mac
> 
> but I am getting
> 
> $ ./configure --target-list=x86_64-softmmu
> Using './build' as the directory for build output
> Disabling PIE due to missing toolchain support
> 
> ERROR: glib-2.56 gthread-2.0 is required to compile QEMU
> 
> when glib is already installed using brew.
> 
> Any ideas?

1) Check "config.log" to see the exact reason for the failure

2) Check .gitlab-ci.d/cirrus/macos-11.vars to install the same packages on 
your system, maybe that helps...?

  HTH,
   Thomas

