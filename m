Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4422105lfa;
        Tue, 8 Jun 2021 06:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzer+bhCInFdyO0lg6W/Own2xsr4rr2gT7cxMlEaAIxlD/WqgWq1ZhFOvVCMBIQeyVz4TN7
X-Received: by 2002:a50:eb08:: with SMTP id y8mr25883832edp.89.1623158846533;
        Tue, 08 Jun 2021 06:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623158846; cv=none;
        d=google.com; s=arc-20160816;
        b=bU3I/T3QLGNxI/C6/9RJTEqbB8iF3hz3jnT1LL7axUEAWUqB6lxgNmgMFBDj6wuiE0
         zQbf3J4bF0OkD6zjadNwP8orSAt/UFO+FBF1o4Rsw8SYP0Z92JyiPLaC02W5bdTEVPP/
         8SZ39SrAyLpktI3dyapJnqH6MzjK2cA4Schfriv0kRahNOuYVjo11TXWIN5vmxJD8lp6
         2P08y2hew+q2D6teK4yPWxGM1sR/DOmWJKBKkK2cI5o6exVcHMuOMxJLJNFpFk1iOMaq
         lWeNho2zdpzE4sVq6TH/DYBkoLABCDgKxikFzLwU7MYuw/dbutKaumNzD4peNMiDlpBQ
         b1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9vA4wvQfYCSoeKhPAGn80z1qKFcAzjBUUQDbPFHYSpk=;
        b=zKMXpPnMTdShgrRofH0HSPXaxoZ26plA7DGNb9nMzAs5xjOBPZ+Ww+CeZvbuJM3XZb
         AmIABz1jQGx7z3ELetKhPkesiLaIcFZdciqbuxmr7BZQ8himSi61z/8royPfYY0k55q7
         ULqMwyUUCGlgcQd11Jkf48XDCa8SaCHfXCWmZtoX7txjFKwyl+ObuLRagCbh8XTPp7Su
         Psls9n/9cHPEUuMz1zEU1Df4ZtcaV3FkxX06kbL87C5za1xA2dVL2mC/M3trhN4FKG1+
         I8hcs42b4jAh6ZtZvtDg6QgNn63O4sWsJmuhiFxEOI6s9eKeIgqvTpGmfkR06uFAgt1B
         sklQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWa7k63I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bj22si15850112ejb.53.2021.06.08.06.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWa7k63I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623158845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vA4wvQfYCSoeKhPAGn80z1qKFcAzjBUUQDbPFHYSpk=;
	b=iWa7k63ITHSCEl1DIG1ApCvMT2M/Rw37sikSwS9VPDW8TfqzoEawICBFzOqSmWcH1I8iL1
	AOeJoOmYCtBvARUQmCyNjv1q4+c+eQUJqgWYb4C+msoAL+LrUDKvYjcYuW0VW6mxn0SS07
	V+0TGx50VnN4Sp9FTgr+TGSXym/uB70=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-rxgnq3-hP2Ctu4A1WXs_CA-1; Tue, 08 Jun 2021 09:27:21 -0400
X-MC-Unique: rxgnq3-hP2Ctu4A1WXs_CA-1
Received: by mail-wm1-f70.google.com with SMTP id n2-20020a05600c3b82b02901aeb7a4ac06so1184298wms.5
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 06:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9vA4wvQfYCSoeKhPAGn80z1qKFcAzjBUUQDbPFHYSpk=;
        b=e9ezuHlLHwvEJ+ITi43C/pTBSlRwyxXt80RIxSdQJHk3J1MOouO5HpgAe2zo1K5MGP
         UXPk21JPSITBZoTUcM+isUTfN/UoOS2LgFACiAK8STFaw3vzSiw4jEOmsaTUnORRjLJw
         m2amDmuuby1jty1rNpZmj9p8Dm/cMZbAOZGUnDyuFdOHGOt8fBGtRlJHhHyC03Bm6Hq7
         mWxqOhi2PVZ/zuzdKibCJRhzhjG/bj2qKwoPxQtg9Ux1q5eVp0bq0PrMCtWin9DZSX+A
         dAhv40qNNsU5YAuzkW59inQLEYSAO30/0SePjgWtzJz4YxEvsmlevzgQ8+Tg6C4ucz2z
         HKDQ==
X-Gm-Message-State: AOAM533ztSoheTO5vcONzYvgRb5dvsSvJeJ6YdYgoz08FBhYNbwGOawq
	iN0cZOKnhcBrg0/wjIY1gR1uaALZD0mQF/+yztSvPExMBCNuIu6OMx78nP5CXKJ6tpEaf6NVkGo
	qt4QV1hzkGKRK7GMb
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr9225036wmq.9.1623158840405;
        Tue, 08 Jun 2021 06:27:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr9225019wmq.9.1623158840190;
        Tue, 08 Jun 2021 06:27:20 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id 25sm2952365wmk.20.2021.06.08.06.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:27:19 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
Date: Tue, 8 Jun 2021 15:27:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210526170432.343588-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rO/jm2PdAI2K

On 26/05/2021 19.04, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>    specific information. Currently the common structure base
>    provides the name of the accelerator, while the specific
>    part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>      { "execute": "query-accels" }
>      {
>          "return": [
>              {
>                  "name": "qtest"
>              },
>              {
>                  "name": "kvm"
>              }
>          ]
>      }
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>    to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>    at runtime (chat with jsnow / eblake).
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>   qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>   accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>   accel/meson.build        |  2 +-
>   3 files changed, 87 insertions(+), 1 deletion(-)
>   create mode 100644 accel/accel-qmp.c
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b72..586a61b5d99 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,57 @@
>   ##
>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [
> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
> +      { 'name': 'qtest' },
> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
> +
> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'AcceleratorInfo',
> +  'data': { 'name': 'Accelerator' } }
> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "name": "qtest"
> +#        },
> +#        {
> +#            "name": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }

What about Markus' comment here:

  https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.org/

?

If I've got him right, you don't need the command at all, the Accelerator
enum should be sufficient?

  Thomas
  
