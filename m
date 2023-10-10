Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp14436ejr;
        Tue, 10 Oct 2023 03:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3kx7BOZCmXFijrwO6PLSc7qlmxU4tIKVPNTLmcL+t96Pt16Rm4zVN5N1jG5zzS6rm+zA5
X-Received: by 2002:a05:6870:7188:b0:1bb:b9d6:a879 with SMTP id d8-20020a056870718800b001bbb9d6a879mr21699676oah.38.1696932218319;
        Tue, 10 Oct 2023 03:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696932218; cv=none;
        d=google.com; s=arc-20160816;
        b=OXs3SQ7HvXSwRuB873HHHsY5AWSs8HKfEYun6WfUGW0pZVvD5lBcvJohjp0GcQHD4o
         t+kbJKKUCzr16T8VkNp/XO68O5iTzTdXg596tOG3Gf0KRmb9id4edbf6ViAwZ/zAmwmQ
         zvFosKJB/Ol4fA+2laDKsz7bqfjI5CtKz7QKGy/WMezLkrXyYLT4hj97vPri09UwMKLA
         LTBiNpcyLR+Md07ptmhpz9uoEG/A8ub9gN7tnPbmA1B/jAGhQsV7NcMhyvVCnkFF5oPi
         3MSY7IdOLtg5OUvTuKpiQxQ4IbgjX0hzUlEiFfvhoIgpPpLlC/ZEwpmucTi7d4uZ2nhS
         aBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=yXPP1UGLVJ0hHmKgWXpD76iLIRJ55dWRCsf0gatVcxA=;
        fh=MV29w71Pm49mQBNyB44CnEB+zL3OzTdaVaG0xGYSxt0=;
        b=lOh9p3LYaoUnGBJYjADgw0QzMIoDG+X0MwLcykncigl4lJV2jSdu+u76Jn51WzhgK4
         bd6H089lszF6+OkvpAyRiaRD2Hj1jefbn8RE0FlwzcJZ9sqjXyQ8LpDmy2sgkkK3hzT9
         pkiPXb6K/ARDK4ZuAfSSHm5Es1g1J13XUw0CdNg3bw+ZsHv1JICO/vhbasJ72Oi1upUg
         PI+jx/fj5C4vc0zCUjAsEyIlI4qX05F5OE4+VPu66wAA1yt3iZv9nPcQ+/XSq/Y2uh0L
         gjLaujGsVUExaEsfK1Q4rt3UFOnt6ky0swQokI+qpYWbEKPF35UYi/ZWBszTa3WTjoPq
         +7dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3CLvttc;
       spf=pass (google.com: domain of anisinha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=anisinha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <anisinha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t12-20020a0ce2cc000000b0066cfc438827si176634qvl.570.2023.10.10.03.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 03:03:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of anisinha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3CLvttc;
       spf=pass (google.com: domain of anisinha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=anisinha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696932217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXPP1UGLVJ0hHmKgWXpD76iLIRJ55dWRCsf0gatVcxA=;
	b=a3CLvttcpJanlblLMxBVmy96VSG7tGuS0xQRz/QO9diPTYoS1GnlbbRKGMyDoYDxSkw7q9
	kH9pJxJ5QfCIR8vR1GrymHPCHMOZsj0jzKMIzcTFdVP4MOP7oodfJOyEfrpIk6GD/Ju/tu
	H59D9QThzSvR1B4mCTa0zNTSvqGy2Qg=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-vMsLYIitM_e8cjZA-3CZlg-1; Tue, 10 Oct 2023 06:03:36 -0400
X-MC-Unique: vMsLYIitM_e8cjZA-3CZlg-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3ae4af890f8so9699988b6e.2
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 03:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696932215; x=1697537015;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8QCDL2YPCfJjIjG+t0h9Wcrjm6l5oi6SXDyDrL/uMw=;
        b=v5EWso37WN94wLuyKGtVc/Pq7egbj5FHchZpIi456cDw/h7RbHMHPT0PiIN5b2cncN
         416bHj9/NUfsPoSjRVBn3UomJmq4+E5U7gENKbQuwnFc+wVcfK1ywv7tOOPXi8Hmb0wG
         fxgSZUUnf8y+OjFdlokiuYM5kYdGXZkAp2mzWWx225OOBLVpUZpUjsxXU06RguDGKkmC
         IagAsCtMkkq+Z/rbllAwbXK1y1tn26U37sPSU0YeL0LFvE/FWxCOeJ2TTr4Y/UuQmsnX
         /mNvJPfF8FoFMoR8ute+39mRCq4xVNeTWQfKBYZXSAH5YmAg72GCv3PWBT/VCDctWtuv
         bSVg==
X-Gm-Message-State: AOJu0YwtuZH7PzcgbLg2J9xveJq5gQshi4FW1nb3u3KmGiB3/l55LB+J
	EBxbIldoGAEOrJTJyJ0zAylVZzWqCwm9arWXWhL87ryC7d4v44pCbCpY6Dhe1janMHNQplvnAgp
	+XNOgLqToyOhiUHLw
X-Received: by 2002:a05:6808:200e:b0:3a7:5b1d:9470 with SMTP id q14-20020a056808200e00b003a75b1d9470mr23487447oiw.53.1696932215683;
        Tue, 10 Oct 2023 03:03:35 -0700 (PDT)
X-Received: by 2002:a05:6808:200e:b0:3a7:5b1d:9470 with SMTP id q14-20020a056808200e00b003a75b1d9470mr23487418oiw.53.1696932215424;
        Tue, 10 Oct 2023 03:03:35 -0700 (PDT)
Return-Path: <anisinha@redhat.com>
Received: from smtpclient.apple ([115.96.109.49])
        by smtp.gmail.com with ESMTPSA id u24-20020a63b558000000b00577d53c50f7sm9609618pgo.75.2023.10.10.03.03.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Oct 2023 03:03:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: [PATCH 2/4] tests/qtest: Use qtest_get_arch_bits()
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <d69ced42-5fba-8dcc-5137-2fa95b97482e@redhat.com>
Date: Tue, 10 Oct 2023 15:33:29 +0530
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-Id: <2138A1A4-082C-42B9-ACD1-C1BE9D715EF3@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-3-philmd@linaro.org>
 <d69ced42-5fba-8dcc-5137-2fa95b97482e@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XTw/Ir2Ry3JR



> On 10-Oct-2023, at 3:19 PM, Thomas Huth <thuth@redhat.com> wrote:
>=20
> On 10/10/2023 09.49, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> Some short patch description, please! Why is this necessary/useful?
> (I think I know, but other might not, and it is also important for the hi=
story)

Other than this,
Reviewed-by: Ani Sinha <anisinha@redhat.com>

>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  tests/qtest/arm-cpu-features.c | 49 ++++++++++++++++------------------
>>  tests/qtest/bios-tables-test.c | 16 +++++------
>>  2 files changed, 30 insertions(+), 35 deletions(-)
>=20
> Thomas
>=20
