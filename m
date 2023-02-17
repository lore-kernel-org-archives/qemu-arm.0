Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp70144ejb;
        Fri, 17 Feb 2023 10:53:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+4IxYEEyPcs4WaEJqP0P65qzAkuZPLYCO4lDY1Be87dMdNmCZbk/4mZA3LJYWxBa/LRu28
X-Received: by 2002:a05:6214:c66:b0:56e:af8a:a872 with SMTP id t6-20020a0562140c6600b0056eaf8aa872mr1890812qvj.11.1676659989770;
        Fri, 17 Feb 2023 10:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676659989; cv=none;
        d=google.com; s=arc-20160816;
        b=F5y//pqWVFazLmSJtyF8Iu335ygr3EfslbX2oTxiiuOpy2uz6S3bngqxImlv95E2/P
         iXMUzhJVNMYxrWkTVwIbmSchGjWUbAShoZ7pV4saghkmXqL9OvHJM2qZ+viE2hDeddOV
         DbUY20miAhemJ2R4WSk0L9amF+mOv0ZsQwoKU3NiY16eJ98/Ae0V04FTEUQtD9zksp1Q
         4zTuXAHE6jCW/S3HINpdQdOH4j1XRIJcNDc5d1OKFPTyT8NWzoyD+hh5ZhSzFadqRXjI
         DKfKDpY0n6LIcZQ1XDpWRli95kGx48RIjLlnolblHnQ+omg8L7u+UFBzWsksHO+nerhD
         0wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/Zcl86PmhB0FNxDkWkIGFOBkJRHcxrG0wbwem6jZgFc=;
        b=PCKHBg1oQsNp7rVIHK2qXn9yKrqKOVeiCBhm2Q33dk6H0UeGEuvniKzqbhkYhcLx9f
         Q1HmZd0aEOvQN3Nv0GH2mdYuy97pEDthTBmKlN8iulJ1gFV8e9gaRw6h3h5GiAO8qlLA
         +WEIEPtGybaOaCnpOYSx0rjxGxyJ1BBoWJS0Fm7PMTeGgOrAhC9/v5Rz1t2gR4mKOYEn
         NuhpnGfF5gmPYhdedmNwRYIeFoTo0ZJDkEjpvFa+H5+Ymxu6nK38zOgQoxAxP7hTI4AC
         9A+mkAJC05q3byzAa11iYlUd8/ONAW4LBaMBgHHiNQxu6jyouLcQFwOQDOV2VZCvM+7G
         epsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fWYRDEBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a0ce286000000b0056b8269da68si3546320qvl.259.2023.02.17.10.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 10:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fWYRDEBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT5r1-00067B-0j; Fri, 17 Feb 2023 13:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5qz-00066q-HC
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 13:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT5qy-00076n-6O
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 13:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676659982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zcl86PmhB0FNxDkWkIGFOBkJRHcxrG0wbwem6jZgFc=;
 b=fWYRDEBtu8h9HXJdTPHHxIi7sTYRBxy6pndpTeNHN+wy8n173b6pGwC7mVB2pkTaoiId2/
 AM+MtxN2W4dF7P3JGvvmkCRa2/4/AXDqYpUNVzVWFsW85UPF+mlkIx71m1RCmteYswtiLf
 AYDP5eb+ZDOSo8Jof3hEeJpbSHSlb9w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-CwQ72LjPMU-swF-rOG1eOQ-1; Fri, 17 Feb 2023 13:53:01 -0500
X-MC-Unique: CwQ72LjPMU-swF-rOG1eOQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg7-20020a05600c3c8700b003e21a3f4e84so713483wmb.8
 for <qemu-arm@nongnu.org>; Fri, 17 Feb 2023 10:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Zcl86PmhB0FNxDkWkIGFOBkJRHcxrG0wbwem6jZgFc=;
 b=RV0P/Ur02b4BBW0Oh/uo/PzPgwF3bY/XFONQtdhOXg91nXE61gP4JjtUAfZWFgLoau
 SEwBcGqUGnfpjtDec/vshDRcrtQPNjqh4ZA6l+kiTlParRxB2x3Fhpsp7ZU2oQJHwRF9
 xCWLPzxbQnp0sS9IYAYqY9+ucUWZ558bTJcKkoa3CyqrKILUlJRm93/bfeLHe9Wij23b
 L2oDrR4n2Grs8z1oLxJ1NDqqtYwUKCX+d5/+vB8xKRyz7yF/SuF3R53Kiw+R8LZ3l51Q
 afJqTgM+d79ZIsdqZbTcSxq8u0C+tkHOlznTLETnlKlCwtEgmRloQ1xi5cRJqKxrvb5t
 S8Lg==
X-Gm-Message-State: AO0yUKXkrXmCNDCO0W7p/ccw1bXfkJk79cgKyGhzEH1DTe8L8zl+VeKf
 QwBufLaKlvpLhp/E/vS+c/KZO9RFDIZ0vL9PdrKjLX7PwmXRJgoTNNaQWvjRmIee/0zc1c94FCH
 7jHvLfyvEUKTB
X-Received: by 2002:adf:eac9:0:b0:2c5:5878:8fb7 with SMTP id
 o9-20020adfeac9000000b002c558788fb7mr763871wrn.13.1676659980600; 
 Fri, 17 Feb 2023 10:53:00 -0800 (PST)
X-Received: by 2002:adf:eac9:0:b0:2c5:5878:8fb7 with SMTP id
 o9-20020adfeac9000000b002c558788fb7mr763850wrn.13.1676659980303; 
 Fri, 17 Feb 2023 10:53:00 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b002c573a6216fsm5123870wrj.37.2023.02.17.10.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 10:52:59 -0800 (PST)
Message-ID: <8daaae78-c773-af8c-de6d-c3b0a45d4253@redhat.com>
Date: Fri, 17 Feb 2023 19:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Jason Wang <jasowang@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230217141832.24777-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: m/m789lPiF3B

On 17/02/2023 15.18, Philippe Mathieu-Daudé wrote:
> "hw/ptimer.h" API is mostly used by timer / watchdog device
> models. Since the SoC / machines only access the ptimer via
> reference, they don't need its definition: the declartion is
> enough.
> 
> On order to reduce the inclusion on the source files,
> forward-declare 'ptimer_state' in "qemu/typedefs.h".
> Use the typedef in few place instead of the structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> "30 files changed"... but since this is trivial, there is
> no point in splitting per subsystem IMO.
> ---
...
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index df4b55ac65..effcba4bca 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -104,6 +104,7 @@ typedef struct PICCommonState PICCommonState;
>   typedef struct PostcopyDiscardState PostcopyDiscardState;
>   typedef struct Property Property;
>   typedef struct PropertyInfo PropertyInfo;
> +typedef struct ptimer_state ptimer_state;

Would it make sense to properly CamelCase the type while you're at it anyway?

  Thomas

