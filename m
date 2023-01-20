Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp973766ejc;
        Fri, 20 Jan 2023 02:27:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfcxRsXG8QsT/hiZ6wdegjBuj/Nt+Rn5Waaxr7aUULVX9bdtvPeO0N/O29YQ+RaWT+iMLN
X-Received: by 2002:ac8:7107:0:b0:3ab:d932:6c4e with SMTP id z7-20020ac87107000000b003abd9326c4emr15885405qto.18.1674210462227;
        Fri, 20 Jan 2023 02:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674210462; cv=none;
        d=google.com; s=arc-20160816;
        b=dPH4cWLumJJeEk7yuqEBZuZttCJFI4FKzhbPeleH+6bcgOnUPwsOoYnTe5B7nfh8YM
         gYUovADOSIRYVSqjUPwnwmMtx0ED4TxtYgOwAoRCyOqUoBf9+R2lYhWSpBnLGx6AOQ/c
         ViZ6LzHlVQM6PvgZvomGDPiilUi2gvFmRCC9RF/CkC2Qbq8cCTN8/VLKPO8cZc85lbQO
         noGc6cJ9NRehXSoPwUPIMWuAfPA/Fmbo7QY3sroq+3kkTB60OfevkEC0lphovTTgHcX/
         gJA4icDqhAayN7m8+g+LrVkQKgKptBavfMQDn60c+hRo7dWwiq26LDCuraml3urVAQQ3
         t9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rCVypidnFx4JW/rDZPAfoj7ZI+PT0BWLXal/Pm0vWNM=;
        b=YalmB503czyn6HfNLxfZD8ndLVqfpZGw9Kasnr2hdVsUWJXczfdZEC1SzDTM7eOK26
         r8p7mL1JXfoRbW7v4ZmZoarRRZQ3Sswt+vbF489bhPSAU9gLyTN3OrJ993d3fq4FY9y+
         F0NLciPbNk5Y6XByAq950ZldDiOSbatUefOmGmTMwkFwGdVIBppADsJNNpH+aWVV5zFe
         0qLPQspg0UQLkzArjl0cyIbRLcw2LtEWl5snor+0SbocMdF6id44LwKehWC6kMGZ2HXT
         csm9Nt5QR3GzNWbByR6q+oL98O6OEJcMXHJsUn9VxkP6qsscO6s2Stq2ujhe8EfQLskx
         rwmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RBK34XSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020ac87244000000b003b631045b56si8716567qtp.633.2023.01.20.02.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 02:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RBK34XSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIoby-0005up-Gj; Fri, 20 Jan 2023 05:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIobx-0005u3-Cy
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 05:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIobv-0001Ws-93
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 05:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674210422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCVypidnFx4JW/rDZPAfoj7ZI+PT0BWLXal/Pm0vWNM=;
 b=RBK34XSrD+QLd24ryUY0ZcGwHnX9mRyt8loWTBkSTl+QL9twIo51cXgggnLPdOCCQp+5wD
 N/T3UTyPX9Y0+H9cFDtV8THycbyDYctiOoqTDJ5OGt/H4eJIb+4HB+sKHOYCnHVdPok9rh
 /Geo+iXsCqFhmA3bVCKvLt/1PqnIfhc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-yeX_luCtMKKvf4Qp0rHsDw-1; Fri, 20 Jan 2023 05:27:01 -0500
X-MC-Unique: yeX_luCtMKKvf4Qp0rHsDw-1
Received: by mail-qk1-f200.google.com with SMTP id
 u11-20020a05620a430b00b007052a66d201so3183208qko.23
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 02:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rCVypidnFx4JW/rDZPAfoj7ZI+PT0BWLXal/Pm0vWNM=;
 b=v+YaiWYJI77+qM6y51ryUblrWfyMVg3V408sQGt2ZYCbe9mksDgoEXPgXozhA/ve05
 Aj5RClOpsxqEnmcCcSw/iIhJMFRwvQfgfz5xdpGf4p9f0Lq0/jV++Pb+IDlnNIF1dGVx
 lYJzZjnoqYWpD5RYTsieMUimakX4/JK5sU2u2MWRca2SEdmAD7NDq2umVgIoxMDazgEc
 bPo1m7e/Mx9qt7jThoHQLFQzWzxDCsQi19THE9QMnnEuoV5Y23Nf2Rw+bHfELSXoWK4p
 DYgfujJGVKHbjZ7HHoCWQMO1ClV+0kWv2wj6IkkT8OlRBac9TikteLS6J2dBWzbNxUDp
 AhCg==
X-Gm-Message-State: AFqh2kpASHy2UDlTp44UNSl/rQO+g8HHO69jqgDgf3kpO6Ex0lWNvk09
 XYRTLQ3oDIvXOGa+6c6ZuaJ/bKMYtE52Q1XNAhui8Tq5KXLOokpqua3sJERcxBknh0O6FMTEMnh
 Jpuf77Hk+LB4d
X-Received: by 2002:ac8:5444:0:b0:3ab:af8e:64e6 with SMTP id
 d4-20020ac85444000000b003abaf8e64e6mr16443125qtq.67.1674210420519; 
 Fri, 20 Jan 2023 02:27:00 -0800 (PST)
X-Received: by 2002:ac8:5444:0:b0:3ab:af8e:64e6 with SMTP id
 d4-20020ac85444000000b003abaf8e64e6mr16443107qtq.67.1674210420281; 
 Fri, 20 Jan 2023 02:27:00 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 q44-20020a05620a2a6c00b006fc9fe67e34sm11812905qkp.81.2023.01.20.02.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:26:58 -0800 (PST)
Message-ID: <c41c336a-d435-ec2a-ab05-2f50c05645df@redhat.com>
Date: Fri, 20 Jan 2023 11:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
 <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
 <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
In-Reply-To: <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: byAuc/SEdvDK

On 19/01/2023 13.05, Thomas Huth wrote:
> On 19/01/2023 12.30, Philippe Mathieu-Daudé wrote:
>> On 19/1/23 12:24, Thomas Huth wrote:
>>> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> RFC: CONFIG_HVF is poisoned.
>>>>
>>>> We could pass host config definitions to qtest using:
>>>>
>>>>    diff --git a/meson.build b/meson.build
>>>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>>>
>>>>       accel_kconfig = []
>>>>       foreach sym: accelerators
>>>>    +    config_host_data.set(sym + '_QTEST', '')
>>>>         if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, 
>>>> [])
>>>>           config_target += { sym: 'y' }
>>>>           config_all += { sym: 'y' }
>>>>
>>>> Then test for CONFIG_HVF_QTEST ...
>>>
>>> I don't think that would really work well. The qtests are build once for 
>>> all targets, and HVF is only available in the target that matches the 
>>> host architecture. It's poisoned on purpose.
>>>
>>> The TCG accelerator is special, since we have it in either none or in all 
>>> targets, that's why we can use CONFIG_TCG there.
>>>
>>> The kvm part is also rather a hack... we should maybe rather additionally 
>>> use the "query-kvm" QAPI command to check whether it is really available...?
>>>
>>> To fix this properly for HVF, I think you'd need a way to query the 
>>> available accelerators via QMP, too... Hmmm, weren't there some patches 
>>> for something like that in the past ... can't remember right now ...
>>
>> https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ 
>> :(
> 
> Ah, right, and we ended up with the competing patch from Igor since we could 
> not quite settle on the QAPI extensions?
> 
> Hmm, what happens if you execute "query-qmp-schema" on a HVF-enabled host 
> these days? Is there a "hvf"-related entry somewhere in the response?

Alternative idea: execute QEMU once with "-accel help" via 
g_spawn_command_line_sync() or g_spawn_sync() once and look for the 
accelerator in the standard output.

  Thomas


