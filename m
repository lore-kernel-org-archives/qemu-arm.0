Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2467143ejb;
        Sun, 3 Dec 2023 20:42:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK7zr6RSC2eIrt0zPDGOqlC1Ci0arj5GS3d928SpeO/uJJYs2hStvA+Fcrrwnr3j5i8Dib
X-Received: by 2002:ac8:7fcc:0:b0:425:4043:50f0 with SMTP id b12-20020ac87fcc000000b00425404350f0mr5970328qtk.127.1701664967258;
        Sun, 03 Dec 2023 20:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701664967; cv=none;
        d=google.com; s=arc-20160816;
        b=bCYo2m1W6b8jCFvMjNpTwwlBIvKRCplxOXzJFP8ILFf5ZY8PDmUpa6V2srukA0FdVP
         6Six0xKsA3kMg3HP3mZ8RROZ5Rn7Wj9SQuBSvK5xrtemrijdf6c2zcKo/RFCgCd8DOUt
         oMXCy7H9fgZ3Hf0UBRWj86Ygl0G4z678Uhq29oKeXkn+wUtPAkSoSuS7SXXvwv8MywU5
         T0XPq7knD4zbbCi4abB85+plvYi6cS4oMnkr5V44xy8b/EOxjWuwgQJ08n0H8Xwh4BWD
         q2ojCHJ37vx7csj2YP+tFfAzkEQUZ2YhBXSCFk7FGvVoVxwdsc75ddqeXKiNpic3Il21
         i5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pRJvIo760Z+rlHzQ1bCrq/yapq6dYTsZzpyUzIf4nlo=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=A90orhIZXjiEmGerPGSsT0kQ8VD/JmgAR9iUopwpLGuepOmol1N/UUBYrNr/qIVuIk
         Orv6AX5Q6vyQAgD6syJg/BS/0RBbliqoQiw8cA26IF5WV0kpFOpnoneUysLhSiFQTqL4
         dC6uQx2zgFq0GNurScwo4cNUer4mwlDZL039Uf/RRuPkV+QD6fFq8ad3Fvk0rLQIyuvD
         V6cPc/3bV07I7kT55FQEI24QULx9tTmnT5IJRIKHqOd84oXZJCIrYFzONCf00sfy4E8X
         +oqYkrLmMiXDGetGJ6b8wFly/m7Yuu2uz/8keq63YzDJB6goR8tKKmtLjEFd/BnNuPsR
         49nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Tja/d4FN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw23-20020a05622a099700b00423a1b4b235si9376003qtb.319.2023.12.03.20.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Tja/d4FN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0n2-0003mU-16; Sun, 03 Dec 2023 23:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0n0-0003m8-OL
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0my-0007sR-LP
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701664954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRJvIo760Z+rlHzQ1bCrq/yapq6dYTsZzpyUzIf4nlo=;
 b=Tja/d4FNLVX4YgOYfz/eqt57l5K36tzhq4bzOWFYoPzoDbrp04xT4y0UK1B/RAG9Y3F6rE
 Gj7KJI9CNUZymQYrcMfv8N/WHuSZIRRQ6aTepgqyGqrJZj2qYQxGXCNl5U2WvYO4i2ym0Y
 vKMncJvhGbCfrkJzvEXYg4aJSeRMsB8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-56f2Ow4PN5S0F1tC46GpxQ-1; Sun, 03 Dec 2023 23:42:33 -0500
X-MC-Unique: 56f2Ow4PN5S0F1tC46GpxQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1d06b8d7982so9131905ad.2
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701664952; x=1702269752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pRJvIo760Z+rlHzQ1bCrq/yapq6dYTsZzpyUzIf4nlo=;
 b=bS8B7xTs242khiOF8zUqIJxQAkKbGb+F79gjAKJbCAfQCsrrXwQFTEJuFIxGPQtFXM
 /Oj4h7rISTJrryHsTyg0++zgQS/lV30596JqtyYtoomLhsUjsY+TtgF9Tt+Gqm90vU73
 zf8n/Wy6+9if70N7lpMi/TU23FGBEWnx3H8K98rQ8w2E4KqRfzmPu1zGUzLV8ZdAeMJA
 nbbh9hWyi1Jg14A9pcKsfjTDFR0a3nVS42bX0oPMYv8nqjb/hGVNy3LdTo4NUylWOp5x
 5nvE6WvvuqmhDGfTcijvkaPDvIBsvfZdWEaioCYA/FKwIxSEaZguyNNe0yauRQBAuZyc
 FZYw==
X-Gm-Message-State: AOJu0YypgKXPPoF40oH0wiSX0TbiJUg1bZzUBD19KkB+TQ2MBEenmoba
 rKvvNYY3ebNAakDa48UEkYsDam9eePbkFl6aH3hh+gdC7sEu3quvPdoPkuBEyBJ/LYUDVHUoYpK
 Te5hBO1VriNLS
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:ceb7 with SMTP id
 z12-20020a1709028f8c00b001d06ffdceb7mr1282098plo.112.1701664952050; 
 Sun, 03 Dec 2023 20:42:32 -0800 (PST)
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:ceb7 with SMTP id
 z12-20020a1709028f8c00b001d06ffdceb7mr1282078plo.112.1701664951655; 
 Sun, 03 Dec 2023 20:42:31 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:42:31 -0800 (PST)
Message-ID: <fce90e73-7383-4a97-8065-ca9f7a9bc414@redhat.com>
Date: Mon, 4 Dec 2023 14:42:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 01/25] memory: Have
 memory_region_init_ram_flags_nomigrate() return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-2-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: OyXJIid8bftz


On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h | 4 +++-
>   system/memory.c       | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 

With Peter Xu's comments addressed, to replace cpu_exec_realizefn()
with memory_region_init_ram_flags_nomigrate() in the commit log.

Reviewed-by: Gavin Shan <gshan@redhat.com>

