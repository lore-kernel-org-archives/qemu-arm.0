Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp275883ejy;
        Mon, 20 Nov 2023 22:41:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCeIbVi/p+Z4wbmmsJkhdIZf4wMBQR3U9Sga1XJoRhsbApHeIXiIiV1AV4FVoz9oePs8L0
X-Received: by 2002:a05:6102:108c:b0:462:9ef4:e303 with SMTP id s12-20020a056102108c00b004629ef4e303mr5657644vsr.9.1700548894070;
        Mon, 20 Nov 2023 22:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700548894; cv=none;
        d=google.com; s=arc-20160816;
        b=0u2LJlaXIqH5nOwBr/u7BeheEeYfx7Zf+JaSRQGqZP9mqfRafb54YWYPQ34TnmlkCT
         e6QaCPk2d0M1vKGgJzLQCCYOGEB2/3C2qlVT4fQN848P9qBXfkhizRu4icW6ddUoYFQw
         G1Crr3XxDQ6ikL84HAnOgMY7d/yoDcW/uAIiAt2LcPBf5/0T/nI7VgEJT/Th6lQEyVyq
         iSLcua/HOjrYOb+FqS/9/e2Jl6woPjABlOrcEQ8jo+zUDt5N/WVu1Vtx/I/8lqbNJwQR
         jojTQspopNjH5DQY8a98kuOEfyelO15lNWuCLx6kPvmX94YchXisez5EHPXtC7asR6TG
         FyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=2Y4ZQ/gwqngcbRROZUxk+R9F43b/SCscFxn/wu7Qf5Q=;
        fh=KH0DTMqgde4+4Rwb1WF9ae/ufpLMFS6atjYFoBBSP8o=;
        b=RiRBhnI0MnhyK7LfpF+32pHDG4PJIdlVZrACkebSMctsf5mgsQWIOlOYSGuZ/y7/jA
         yRQG1iWjK9FX03f+uXsR25gKdbQcBwBMjZdZilsksx8OPcDT8T3Li0wk9/kmdCeSbPGt
         Ulfgo8K9wY96G6qla+ppUM2W1SISE2NV1UWY58XPtAKY+fcEsmz/aj9ARTuiBE66vidB
         a3WU9GE3e8I79CLIYIzH0aKwneVl6prt9OMDd8OVUuR5ycDKy462qCUhGd7gVB8pdOMZ
         uJlU0qw7K6VFdxG/3DJYs7En6/CBQjQ/VHxX7eScrJXUVHxh8ydbEo0ftB/Xx7nycgo6
         Q/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCtRFIrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a138f00b0041986eba0absi8452331qtk.475.2023.11.20.22.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 22:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DCtRFIrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5KRd-000525-7I; Tue, 21 Nov 2023 01:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5KRb-00051k-JW
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 01:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1r5KRY-0004Hj-3e
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 01:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700548863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Y4ZQ/gwqngcbRROZUxk+R9F43b/SCscFxn/wu7Qf5Q=;
 b=DCtRFIrt7kv3ava/YNksh1bKk7rz8B4L8vYbR7KmDn8KP/AHkMSWOalbYZ9k602jK8Pwby
 eC0H1yX+/kRRpBmdeo4EPcApWLmfKsdQDdOW1lkeFO7LXU4yaW1DL6VZTFHx9CVXCWwjdD
 7gC5tp9BHswAEWIjpu8TgvxmOwdCeE0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-TjYm4a6MOZmlaIOaHNPFxg-1; Tue,
 21 Nov 2023 01:40:56 -0500
X-MC-Unique: TjYm4a6MOZmlaIOaHNPFxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB1D1C0BB65;
 Tue, 21 Nov 2023 06:40:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C56C2166B2D;
 Tue, 21 Nov 2023 06:40:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8B7521E6A1F; Tue, 21 Nov 2023 07:40:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,  qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
References: <20231120115116.76858-1-philmd@linaro.org>
 <CAFEAcA-YRPL_UOu5JPwfY4yRU=USk678JayDjqL=DKQjv+SWWw@mail.gmail.com>
Date: Tue, 21 Nov 2023 07:40:54 +0100
In-Reply-To: <CAFEAcA-YRPL_UOu5JPwfY4yRU=USk678JayDjqL=DKQjv+SWWw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 20 Nov 2023 15:34:46 +0000")
Message-ID: <87learmww9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QNF41ZTbOKuX

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 20 Nov 2023 at 11:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> Both i.MX25 and i.MX6 SoC models ignore the Error argument when
>> setting the PHY number. Pick &error_abort which is the error
>> used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
>> the FEC PHY on i.MX7 processor").
>>
>> Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
>> Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>
>
>
> Applied to target-arm.next, thanks.

With or without my commit message clarification?

