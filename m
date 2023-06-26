Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp971406ejx;
        Mon, 26 Jun 2023 08:44:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bQoJZXs84q9KbuThU0A3k2ti83r5V4mTDJ3G4g6pTWVIvW37IbupLlpWapMVWgJEJb2Aj
X-Received: by 2002:a25:d294:0:b0:c2c:f3d2:f916 with SMTP id j142-20020a25d294000000b00c2cf3d2f916mr618183ybg.23.1687794253103;
        Mon, 26 Jun 2023 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687794253; cv=none;
        d=google.com; s=arc-20160816;
        b=TBTMy0k/jVK2Nqnqa/thg/8ze9apegFK1rsk3AZcYoWq/5g3OIB2legmJ4Jol5oVDO
         SSi1eLjMGlQp4MgvA3KT7mreSURVEakAl9Bfa2bn6r4NlLjSy54Xq2LEkNosEx2NizSM
         Dgk9sXypDyejNhkcIC7E7dy2epHd03EPxLK/wo9ZgErrnGkm/7yElgZ4OrHkWEUPaOnI
         b79XdED/kj3Y33eXNfh2Stalm8gH6AgLr4du7VUYSkoMuGdAR0P4rgTh+mcBQ/NqHfQv
         3Di0dg3N213oy5qTZtk707XZrNqiVTO1nmuFc5yknnYBQ+NEC/USTrav2ibv89dTO459
         TK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7jbtZMjs4+6nWM78/SqZzXJgRhpc/5PUhvaBpcR47zo=;
        fh=0+hEyPVC1MtvNx/GlE5dmr4JBxrj8yF1/IfQqr3yEdk=;
        b=EdqgfntRlZunJ6aDqVAHjkIl/+uV3OVzsO8C4/+JI4m2P+iJonN8nPt6XhHmRIJvE7
         siy+fm2h8uqoe7j7Hoh4GZc9DxJVhvGrtFMoGdVeZDvRZAXFpU4s7l1fP5qVRx8U6YIQ
         NJyTE+g87hbcgneq1npk47PvS4C4x6D0nZS/dsrqmevrMG5+n6KNd3MQHPtmQmXApWKq
         A0+MLtE73e5oR07zcD97Lo8lasCa4SOb0mQKr1qWma3pPaGZ3RHT3IR82pp/j2tZmukO
         UIxrO2TsOPJIyCFWHZTsfAN4woYR4NP4C2IxYpGVblSij9al7QdCozgxkmQGOIMi7JSo
         Vb2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CpHBNfZ/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l20-20020a252514000000b00c19f85ef748si3157980ybl.329.2023.06.26.08.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CpHBNfZ/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687794252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jbtZMjs4+6nWM78/SqZzXJgRhpc/5PUhvaBpcR47zo=;
	b=CpHBNfZ/rXyCiQ2h8VxcHtRh5rYPBFhLvUu4gvyrduvbu2MpqDOyOcMBN7OAnoXKnEf7Sw
	OgkxxqqSZrEmUoVwHhS2ivnSQyDGDtoikF8sr4aAaDCshLdjBjyDQ3KolP8maMiz87FYSx
	oc0gDkBXvgmp3wsRRNOROPseLG+3y3U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-kKV4qjdyNLaaoKpb6nqjwA-1; Mon, 26 Jun 2023 11:44:06 -0400
X-MC-Unique: kKV4qjdyNLaaoKpb6nqjwA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3112808cd0cso2159793f8f.0
        for <alex.bennee@linaro.org>; Mon, 26 Jun 2023 08:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687794243; x=1690386243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jbtZMjs4+6nWM78/SqZzXJgRhpc/5PUhvaBpcR47zo=;
        b=gx2AQnLgM+66wwUO3webj+djSFhQAVl8g3TjzvNFBEb3W2/LM7iqPOMLzBsXqpj/Rw
         ZS7R+UtHKfJoVNqsWT6e/lwFnZjVN+SQNCGS6EEqDJsXPrthWzpbS04vS+8HTxJEP2oV
         DsqyFo3qu2XVmgk3bT/DidWo9VdMjIx1vtNZE9gSc6J0HasNHsj+NjS1bfp+OHpW+8bS
         lQ6m7cTTcKlvxw7AG/IFELw28mMmixP2NmuaIgxexsUPV5Vr1hGitghZlk2xP4iH+nx5
         ZnaSiwmOESKOPSLG8SsX0wV8bv8c5bHotYfVg9BbizZPZqfrBg0spPWJW92a8lKCiyhK
         Y7tA==
X-Gm-Message-State: AC+VfDyMPSIvboJDJQKka3iZtrFHBHfiX1nFZUIAguQX7KJbSSA0bsN+
	HR8GZsqKSE1zkPCGNZ7nmS7fiaXcfnysR4fqDITwmSt894qORhkSa/bvOBfW288r3biKjXYgtJf
	T3bp0rUbv1BxfMOKYhM7RqUHBfQhhIWZ0PUS3Ag6M0C30NtlwO6OJD7/q2ZyBdg0uYRCoA3Izxc
	FT
X-Received: by 2002:a5d:6506:0:b0:313:e953:65d0 with SMTP id x6-20020a5d6506000000b00313e95365d0mr4528158wru.28.1687794243639;
        Mon, 26 Jun 2023 08:44:03 -0700 (PDT)
X-Received: by 2002:a5d:6506:0:b0:313:e953:65d0 with SMTP id x6-20020a5d6506000000b00313e95365d0mr4528113wru.28.1687794243255;
        Mon, 26 Jun 2023 08:44:03 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id v10-20020a5d590a000000b002fda1b12a0bsm7816243wrd.2.2023.06.26.08.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:44:02 -0700 (PDT)
Message-ID: <875b2da3-3f9e-b0b2-3ed0-4c09310c6c0c@redhat.com>
Date: Mon, 26 Jun 2023 17:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 26/26] docs/devel: introduce some key concepts for QOM
 development
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-27-alex.bennee@linaro.org>
 <0c245101-77cf-9e9a-3c84-0293a75125b6@redhat.com> <87cz1i2vhg.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87cz1i2vhg.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: llCGqXRg3TOe

On 6/26/23 15:39, Alex Bennée wrote:
>> There were review comments on this series that haven't been applied.
> Sorry I'd missed those. I've fixed that for the respin which is
> currently checking on CI.

Still not exactly what I asked for; please remove the "The Device Class" 
heading (just the heading, the content is good there) and change "API 
Reference" to an "======" heading.

Thanks,

Paolo
