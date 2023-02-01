Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp534027ejb;
        Wed, 1 Feb 2023 05:07:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9PIoKMdj7L7rao2q4fYiKqSe7ZazNT5wNxqj4zoE5bXA9gLeiW7C8gfGMW29pXc5iPdv9h
X-Received: by 2002:a05:6214:1044:b0:537:ab77:fbd9 with SMTP id l4-20020a056214104400b00537ab77fbd9mr3468490qvr.28.1675256862172;
        Wed, 01 Feb 2023 05:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675256862; cv=none;
        d=google.com; s=arc-20160816;
        b=z30DkLF2mgk6IF4OaJZZxiXrBuhD++PB+bKAXpPnsPvGhwIVufWmOxR5KBmMF6u7Nk
         iTAn3eZTRdPgeXePjme+YMHHSxLLIWJlrLsGJ+7QH92+4fE01DNqY/4b227zijAGmAIa
         niZuwxXpWArqsNmMVWAhWIRtYzS9axIzlpmguJHr3b6HkqPH7hc1W+HUdaDZ0St6l1y4
         2s+FfuCTf383zIiuMY3DWuhW4BUEMH0IUj0KVVuQfPwEh7i8/K7yaZPRTl1JkMZLojDU
         w2B83PG7qHnzJ9wgBwNHdsqtGQSWPdBOuSoAbuDxP23uIBJ8k3MW6H3AKTywQXhann4f
         iyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=uSnbZeOa/6fB7vl4cacgew5wO3bhWiPQVQhRhT/Hed8=;
        b=PcFY7qexcHFqGVKaGe/ibRsIAXw6B8ksjDE+hv62+WVW++T4K5EHSzVSc+FpyWhKrs
         MKr1vgsrtciNT8APm2wmZ9qYb/yyjN4uGi+k0GBj+clA3T0nq4Nwi3K4+47Iji75UD6Q
         YvH18UHt6VDhmW5PnvZO9VEbzPXSvMHObSQSlV4z111OtXzWn7C7tSZzBkmm+sdo7toZ
         n6UFhMD/qSOr/ZkuEXtUusOkYrHCv1b61KSch55D1XcrlPnDH6C759rNQaCj1weLrWZU
         3oKYdDuZ4T4E8vXTdqCeqXDqqkfAE7qinFbUHTsZ8YANK+G9oJSsjBp9APi+C7NV7cWc
         PsIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IKZBtICr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if15-20020a0562141c4f00b005355edfe2d4si11211300qvb.1.2023.02.01.05.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 05:07:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IKZBtICr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNCpu-0007zA-N2; Wed, 01 Feb 2023 08:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCpp-0007y0-3T
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 08:07:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNCpn-0000WC-6g
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 08:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675256850;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSnbZeOa/6fB7vl4cacgew5wO3bhWiPQVQhRhT/Hed8=;
 b=IKZBtICrit8EvcN2pg31tSIz9q/WrAuFVNjg71dEHUKDEYx84NioXZmVibIiow0N8JwVQ6
 s0oko0Xxb1qR2ZEdyfkw/3wcXERAPj4T+bWlaUi3xOQ1RLZyTu9+BVbXk5WoCxdvSWH1kQ
 q5sY0SJZwN6OYdkiz/Slnq8khm3mDUI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-LEnmDDe8NPalOB1nUu4E_g-1; Wed, 01 Feb 2023 08:07:26 -0500
X-MC-Unique: LEnmDDe8NPalOB1nUu4E_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adff106000000b002bfe5fb9649so1882705wro.14
 for <qemu-arm@nongnu.org>; Wed, 01 Feb 2023 05:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQS/tcjv1fnUP4Oml7nphciDVp9alnZIFqlUsHNlXn0=;
 b=vYQtTO66V13/xA79EFrPPXX5fxAVkuvCJii1cLI128aDPfeT8VM1oMlLVkhHs/32Ef
 oEMP3+5A1oeBYS3+LE7cv0K4ETJr0/gAYc/eBI2O78VHpykJhm3EjxUg0UxvBI9K6rc+
 e8NtJjVjU06UdXDz1YafmbfBTQbutXH05tQ+zUe5XrjsFXmvZrN/w1UjwdehY7KNMo+n
 sXqh1TVZBy9ckmTgZpmM00N1QFAEAL3f95NCFQc65thCDRDyDdbuB4L3GNpj8UJMblcZ
 UDbSBXl3dmaMTeo1kEnEDWXS7HIxaS+OFxV51IXj+DDEgkFOKTYQ+fyf9A1Em36b8qz5
 2JpA==
X-Gm-Message-State: AO0yUKUgmx+rH0sRf2n+nO+1P04Jfzq4MXCr4mYlcXhJlE7dl88UWFyk
 W2scZcFJMIo2cOD9K0DTgYep2IL2CNE1YXH4XY3FwtfoL59bY0rh9NaR/BAsuyGXbNF0+d4Qixl
 xVPtlwKdEvAEH
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id
 j6-20020a05600c1c0600b003d9fb894e3dmr2177322wms.28.1675256845048; 
 Wed, 01 Feb 2023 05:07:25 -0800 (PST)
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id
 j6-20020a05600c1c0600b003d9fb894e3dmr2177298wms.28.1675256844788; 
 Wed, 01 Feb 2023 05:07:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c465100b003dd1c45a7b0sm1688380wmo.23.2023.02.01.05.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 05:07:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Laurent Vivier
 <lvivier@redhat.com>,  qemu-arm@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 06/11] tests/qtest/migration-test: Reduce
 'cmd_source' string scope
In-Reply-To: <ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com> (Thomas Huth's
 message of "Tue, 31 Jan 2023 15:23:48 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-7-philmd@linaro.org>
 <87a620my1s.fsf@secure.mitica>
 <ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 14:07:23 +0100
Message-ID: <87fsbpfsac.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lH1W4VwB7O9l

Thomas Huth <thuth@redhat.com> wrote:
> On 30/01/2023 05.44, Juan Quintela wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> I am assuming that you will pull this patches through tests tree,
>> not
>> migration tree.
>> Otherwise, let me know.
>
> I had some remarks (in v2 of the series), so I'm not going to pick
> this up (yet). If you want to take the migration part, feel free to do
> so.
>
> I still think it's quite a lot of code churn for just supporting
> multiple "-accel" statements here.
>
> What about introducing a new lib functions like this:
>
> char *qtest_get_accel_params(bool use_tcg_first)
> {
>     bool tcg =3D qtest_has_accel("tcg");
>
>     return g_strdup_printf("%s %s %s %s",
> =09      use_tcg_first && tcg   ? "-accel tcg" : "",
> =09      qtest_has_accel("kvm") ? "-accel kvm" : "",
> =09      qtest_has_accel("hvf") ? "-accel hvf" : "",
> =09      !use_tcg_first && tcg  ? "-accel tcg" : "");

I know that it is me, but I don't find the ? operator especially
readable.

What about:

GString *s =3D g_string_new("");
bool tcg =3D qtest_has_accel("tcg");

if (use_tcg_first && tcg)
   g_string_append(s, "-accel tcg ");
if (qtest_has_accel("kvm"))
   g_string_append(s, "-accel kvm ");
if (qtest_has_accel("hvf"))
   g_string_append(s, "-accel hvf ");
if (!use_tcg_first && tcg)
   g_string_append(s, "-accel tcg");

return s;

Yes, in the function that Phillipe is changing now, each time that I
have to change it, I have to count to see what and where I need to put
the format/change/whatever.


> }
>
> ... then all tests that want to run real code could simply call this
> function instead of having to deal with the list of supported
> accelerators again and again?

It is ok with me.

Later, Juan.

