Received: by 10.25.21.156 with SMTP id 28csp24894lfv;
        Thu, 14 Jul 2016 04:10:10 -0700 (PDT)
X-Received: by 10.25.35.9 with SMTP id j9mr6407084lfj.6.1468494610834;
        Thu, 14 Jul 2016 04:10:10 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com. [2a00:1450:4010:c07::241])
        by mx.google.com with ESMTPS id f82si1306306lfe.266.2016.07.14.04.10.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 04:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) client-ip=2a00:1450:4010:c07::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x241.google.com with SMTP id 33so5186813lfw.3;
        Thu, 14 Jul 2016 04:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=NRITRWV+E8ej9WFTSztu2NLvbYaeYvLEVvvbVSVnU4Q=;
        b=xMW+terQYov5Wbs6cxSDW7zXTs1miSlzG/I6lex86oI2YKFsLUlBkJRdvLzUsxkFiO
         Ydxd758m+z4bmM2VAjCeiT9hWkKPPZwiY6WtQbzdda4R77WUXwsCLzulsby3vqSi8zLh
         lb0HPvqHa0BJ+y6sFQ0sSkLEdxewO5olYcrmj+12g2oTO3IXQegCmnQ5VckAclxf9d3x
         tyHfba9wDJY+EbgUTeDTM3Ax8Pdh4zOxyt8O9lFzGA8oPu2Mhn4blV7bWU+NhtWpu//U
         veRpOwT8KbuGXa9invViVb7M6TzA6Vn8LUbauW8lzUqHPqXRK7CQEc7TFDbNG/YYXhcK
         ppQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=NRITRWV+E8ej9WFTSztu2NLvbYaeYvLEVvvbVSVnU4Q=;
        b=cObWOJWtQHxIBaqOAzak86ggMF1ySXX4m7qlonq7tP/tsrstGxys4i4t3ye6mfTlp0
         emiHrnwsyeEtwSEE2n8OUwkukFDNElN6np/tLd0goseInLC042eEsa6oTCvsNfSRaxG9
         FWlCsvmBrbVe2kF1QeG4/mDf2LsHtjtZ+NbAJiBF+uaAHENCfoKVxW5TRPjIBREipCgc
         QV+/pD/BK/fjpaK8GTPy/5GZJ99zq3A2hRtLudjGm0nedPHdkVqeo09m5xNDjwtTRnZy
         3zL6MMXbbGdgJI8crOSflmZ1QgC1kRBO0l+lw1BslVfyyLbnUprp9VpI6ZRhjCJfN4j9
         LJNA==
X-Gm-Message-State: ALyK8tLhVEC4p8zIdyviQn8Ba3Mb1jbBhq1apq8xNYWUsPr4q8iRcLpFVnE+Bhx8BpNnsw==
X-Received: by 10.25.22.91 with SMTP id m88mr5725554lfi.25.1468494610381;
        Thu, 14 Jul 2016 04:10:10 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-120-37.2com.net. [46.188.120.37])
        by smtp.gmail.com with ESMTPSA id 65sm455187ljb.48.2016.07.14.04.10.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 04:10:09 -0700 (PDT)
Subject: Re: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and
 tb_is_invalid()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org>
 <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org>
 <87y4544iv1.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@listserver.greensocs.com,
 fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org,
 bobby.prani@gmail.com, rth@twiddle.net, patches@linaro.org,
 mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 peter.maydell@linaro.org, claudio.fontana@huawei.com,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57877310.4070205@gmail.com>
Date: Thu, 14 Jul 2016 14:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <87y4544iv1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: VJIa8UCnTEbE

On 14/07/16 13:25, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>
>> > From: Sergey Fedorov <serge.fdrv@gmail.com>
>> >
>> > These functions will be used to make translation block invalidation safe
>> > with concurrent lockless lookup in the global hash table.
>> >
>> > Most targets don't use 'cs_base'; so marking TB as invalid is as simple
>> > as assigning -1 to 'cs_base'. SPARC target stores the next program
>> > counter into 'cs_base', and -1 is a fine invalid value since PC must bet
>> > a multiple of 4 in SPARC. The only odd target is i386, for which a
>> > special flag is introduced in place of removed 'HF_SOFTMMU_MASK'.
>> >
>> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> > Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>> > Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> This has merge conflicts with the current state of master. Is there
> anyway to have a common implementation that is specialised only when
> needed?
>

The point was to put the assumptions on invalid CPU TB state as close to
cpu_get_tb_cpu_state() definitions as possible. So that if anyone make
changes they can notice those assumptions and correct them if necessary.

Kind regards
Sergey
