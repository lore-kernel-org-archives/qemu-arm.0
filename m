Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp999146ejc;
        Fri, 20 Jan 2023 03:19:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMrydzW2+mcIWVAoWmIrV4ByxyRagYlGSdGJ5YoiqI4E8sD6q0siNgVwyfcXDxg+1SUCOr
X-Received: by 2002:ac8:1301:0:b0:3b6:2cc8:e120 with SMTP id e1-20020ac81301000000b003b62cc8e120mr18249151qtj.39.1674213555831;
        Fri, 20 Jan 2023 03:19:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674213555; cv=none;
        d=google.com; s=arc-20160816;
        b=BPYSOikAao9GY167PbVs3zRyAEn7a9c4y+N2eq3OeoIkfLPKviNUsSYHLNWfDUCbi6
         ALhgoQIPwQTqnIrolqZiDItAS/EYkxhPB/R3TEQVHZToat6mSRs43kZ1mgCq91emX/TM
         I48P1XqBI79cB3fYFQN4+5OWMBI851ZqoegxBn3g8skzSt0Ek0jbD0CxbPmlXALV2m9Z
         Lb5qt3nk9a08S8HdIkhCj9LPZcVrGkEvPnDRI+Tvf6ELKPSzp+z6+CBAdV0afd7L2+tG
         c7lDdg/xGE9q4VLCXQXRSFL2kL50svB315fc6V3XDLtY0Afxj69yw51u9ITWxHepv+AU
         WOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bl8MWkGmf5r5pFEPODckRYjBtxf43AZQf7u1eYG9+Ms=;
        b=vR11zn4F0uOPPEYaWTHAvIyghOYRqaTtKaDhw1cq9gKuc+w/azCOmM0ItVhAxPd929
         OqQrNAFxYrc/GudCFjgLRM+JXzIC+/ELD3o+EB5XmFEvkDXYDSo4HJ5krKa9NfErXpGr
         fkW7Y9T4qQF/MrPzydYkchdpUs5tK/A6zEe91xv8WeY7NDqayTA9+ootxDwHOLwce5zV
         pEyqoOqoSqT2xQ+x0yDy3GRBd79uCIw6osM9oFtasfvyTx0asIkFmMPoejhWvxAws1dd
         rWIU5ytj+0T0SW08u/szx875VFJpmVMlXiu0wz+B9FCVzRfpiskvjNrRNHj2xxWyxAMR
         tThA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jbepr+IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc8-20020a05622a59c800b003b68cad2c60si4069805qtb.241.2023.01.20.03.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 03:19:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jbepr+IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIpQ4-0006zE-A3; Fri, 20 Jan 2023 06:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpQ2-0006yX-D4
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:18:50 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpQ0-0001MB-PG
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 06:18:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so4522747wru.13
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 03:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bl8MWkGmf5r5pFEPODckRYjBtxf43AZQf7u1eYG9+Ms=;
 b=Jbepr+IWpF/Mt/3t0/FGXXbIR54AVtDNn5fx7OPs97gYAf8xqjsYM7Y2hLFDSTSymC
 U+lWmIZEnJ46FOf8wqqFONSpk11VWR4gr5zrpyc4LsfHGo3c1Eia8ea/Z0vrFy+/DrEH
 k7wj3oDyy0lp5g1WFDFqVM4WDZsMqQNy/RdDV8mO8y/WkLVjlhINT3uzS9Bp5Se6T1Dz
 DCsEpb1SvNZ8fnDItQznrgK7CUEWIiiAR4a1MtBD5TPtY0FgOQHcLY4lgtbU3DgmGQDR
 OV4lj/mhP6gXu065dL/GivFccC6Q7rh/JuXtxUmAex6mFvcjSE9bXeqlwYfwMvxX3I/s
 8b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bl8MWkGmf5r5pFEPODckRYjBtxf43AZQf7u1eYG9+Ms=;
 b=cQVsryQj9eZqeJkA4VKd8ySC0BHH46/oOn5UNfAWkCYe+Qxehk+LMZTCtqXzEsMJlF
 J+OPM7b5uJbj7a3Ez6h3fEAqPJ5tefR2EJsrp09uJprfhA2vVyq8kpEhqlAfULmEbD+H
 jxckGHO96c9KhLhH2O5Ko/BAGIaFCtjlbdjd7KGJmOh0aEVPidbSuH/XSBh+z0Rw2jWj
 YLZKJIVUjLwbCf+ACH1j3HYWLhiUU72xuopuWCtVBnJXXM2A/onaM2YKBS6j7BjwsZAF
 r46cPifW+COuAGTkDXQ5BtbYastS78NJAKb3MHL3raMJPjiLXHR9wsOt1KyZJqCZ7zyh
 DptA==
X-Gm-Message-State: AFqh2krvcHp68mLgx7DjWpgSH8wyTnSBUxbYEIO5zAwKe8eNh8mUgG7t
 rpv8ToLdOBGYGq/YESaPZ+gDGw==
X-Received: by 2002:a5d:5087:0:b0:2bd:e220:6b5 with SMTP id
 a7-20020a5d5087000000b002bde22006b5mr12382464wrt.1.1674213526199; 
 Fri, 20 Jan 2023 03:18:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t18-20020adff612000000b002be2f18938csm5876162wrp.41.2023.01.20.03.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:18:45 -0800 (PST)
Message-ID: <7fff2e79-16c6-f49e-476d-53db0ce58474@linaro.org>
Date: Fri, 20 Jan 2023 12:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
 <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
 <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
 <c41c336a-d435-ec2a-ab05-2f50c05645df@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c41c336a-d435-ec2a-ab05-2f50c05645df@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QxB9MC1La7I4

On 20/1/23 11:26, Thomas Huth wrote:
> On 19/01/2023 13.05, Thomas Huth wrote:
>> On 19/01/2023 12.30, Philippe Mathieu-Daudé wrote:
>>> On 19/1/23 12:24, Thomas Huth wrote:
>>>> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>> RFC: CONFIG_HVF is poisoned.
>>>>>
>>>>> We could pass host config definitions to qtest using:
>>>>>
>>>>>    diff --git a/meson.build b/meson.build
>>>>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>>>>
>>>>>       accel_kconfig = []
>>>>>       foreach sym: accelerators
>>>>>    +    config_host_data.set(sym + '_QTEST', '')
>>>>>         if sym == 'CONFIG_TCG' or target in 
>>>>> accelerator_targets.get(sym, [])
>>>>>           config_target += { sym: 'y' }
>>>>>           config_all += { sym: 'y' }
>>>>>
>>>>> Then test for CONFIG_HVF_QTEST ...
>>>>
>>>> I don't think that would really work well. The qtests are build once 
>>>> for all targets, and HVF is only available in the target that 
>>>> matches the host architecture. It's poisoned on purpose.
>>>>
>>>> The TCG accelerator is special, since we have it in either none or 
>>>> in all targets, that's why we can use CONFIG_TCG there.
>>>>
>>>> The kvm part is also rather a hack... we should maybe rather 
>>>> additionally use the "query-kvm" QAPI command to check whether it is 
>>>> really available...?
>>>>
>>>> To fix this properly for HVF, I think you'd need a way to query the 
>>>> available accelerators via QMP, too... Hmmm, weren't there some 
>>>> patches for something like that in the past ... can't remember right 
>>>> now ...
>>>
>>> https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ :(
>>
>> Ah, right, and we ended up with the competing patch from Igor since we 
>> could not quite settle on the QAPI extensions?
>>
>> Hmm, what happens if you execute "query-qmp-schema" on a HVF-enabled 
>> host these days? Is there a "hvf"-related entry somewhere in the 
>> response?
> 
> Alternative idea: execute QEMU once with "-accel help" via 
> g_spawn_command_line_sync() or g_spawn_sync() once and look for the 
> accelerator in the standard output.

There is no stability guaranty with the help output.

QMP is a stable API, we should really rely on it here IMO.

