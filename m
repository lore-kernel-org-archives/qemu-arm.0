Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp304176ejy;
        Mon, 20 Nov 2023 23:56:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr/Sg3Oe4iUS2tWHiVZBVuGAKjg9CgeOri2F3uz1Bz5Y4V+wJd4dRv9LoXB8EjD9t6MOHm
X-Received: by 2002:a05:620a:2412:b0:777:24f1:5e with SMTP id d18-20020a05620a241200b0077724f1005emr12653105qkn.71.1700553368210;
        Mon, 20 Nov 2023 23:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700553368; cv=none;
        d=google.com; s=arc-20160816;
        b=vr/9akZDS5SwO0hTCF+ERLOLHWFZgrx26KmKZ4waMqIhMs2wZLyyAS3zrpp4IffKaz
         9kvqV3/oopv6L9tjC5Yk2XZ8/UsBiW8hzivcHg/P3uMHWn4s/SE22tmng/91lF4UMYHm
         QnvuaqdNBVE9MiBjMHkblpg7UDvwjtTNX52Y11V7jm4uJvUlK69JLfbP7i07bCJ1VnN5
         Gub6UvEKw2x9Yd7XehtX1R20NwEep+LXUJFPnLxkcavL/9l2+245vt0Ch4jTQlOxBghU
         2+2fbaQb7fNFfTnKfTf39lUU5LYMKn+S6eFakddQ5x2XCvpCiXLkcyPhAxdpHsc6bMjN
         qqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=0kyFoBKqDExKcjDhTGC+rhAwI1vFJGKiebjHY64SKyE=;
        fh=KH0DTMqgde4+4Rwb1WF9ae/ufpLMFS6atjYFoBBSP8o=;
        b=YtUggioQjBtB+d5bd7/tuMHMENUrJwegdIfSh2TP9afEZNDBHfYTNogK+R8Gjh03ZL
         UMnxsr+wMD1/ttPUlIGQkh+JO6HOIa/isc93UBOHfTRgu9yP3C7UqsU8peKqgF8wwFIG
         rN/MbJmOOz4TyLzN2u6EfqVVdrDphGQ0GUkM6FyvojoO/fIaGEzKcDr0SQWmGWq/KTmf
         PjIjOY/rwIB3JLmvg3Gs88xAXlS5yH5EghxIP/wK9l+G/PcT4+MDMtLcq1L7Kn8stKvC
         XHnRY0MG1HmGlIwiZkQJdv3p0BJa+0ahux6P8tyOqsDCtes9etRWTeLseDCxkSxpYMS3
         OxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0HC3QjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a05620a2a0500b00765aafce58csi9426260qkp.120.2023.11.20.23.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 23:56:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0HC3QjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Lc1-00057K-Sw; Tue, 21 Nov 2023 02:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5Lby-000531-7q
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 02:55:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5Lbw-0005Xh-Km
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 02:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700553354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kyFoBKqDExKcjDhTGC+rhAwI1vFJGKiebjHY64SKyE=;
 b=O0HC3QjBmTeGlZCuWwDDpgR82Fkq/1a24SEmqhOOImptPvun6pBZDLiks+7epqqS0GUU2M
 K352mYDCi+X/BEJfS/Nlr1EtU84KUcbNp8wtkCOIWz+UxwiSrn7hNC5qNyzTqW73piAdiC
 Vk9Q7NjnEjfGT3REZdT4HikUhopkKM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-JQwfGbqdMOyZBjmT6ZdBqA-1; Tue, 21 Nov 2023 02:55:51 -0500
X-MC-Unique: JQwfGbqdMOyZBjmT6ZdBqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14DAE80346A;
 Tue, 21 Nov 2023 07:55:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E47FE1C060AE;
 Tue, 21 Nov 2023 07:55:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CBC5E21E6A1F; Tue, 21 Nov 2023 08:55:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,  qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
References: <20231120115116.76858-1-philmd@linaro.org>
 <CAFEAcA-YRPL_UOu5JPwfY4yRU=USk678JayDjqL=DKQjv+SWWw@mail.gmail.com>
 <87y1ermx1b.fsf@pond.sub.org>
Date: Tue, 21 Nov 2023 08:55:49 +0100
In-Reply-To: <87y1ermx1b.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 21 Nov 2023 07:37:52 +0100")
Message-ID: <87zfz7leuy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cT7KM8gCIiQH

Markus Armbruster <armbru@redhat.com> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Mon, 20 Nov 2023 at 11:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
>>>
>>> Both i.MX25 and i.MX6 SoC models ignore the Error argument when
>>> setting the PHY number. Pick &error_abort which is the error
>>> used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
>>> the FEC PHY on i.MX7 processor").
>>>
>>> Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
>>> Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>
>>
>>
>> Applied to target-arm.next, thanks.
>
> With or without my commit message clarification?

Uh-oh, I had mail trouble.  Resending stuck messages.

