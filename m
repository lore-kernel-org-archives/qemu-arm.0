Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1376198ejb;
        Mon, 4 Sep 2023 07:22:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5eIPrYSm7/iMrtDNNPDt5jQwzrP99Ef/KbRWKPnlU1O2+zLIuQwnoR+mB5rDtvYh/hf5P
X-Received: by 2002:a05:6214:5c04:b0:651:679b:d35f with SMTP id ly4-20020a0562145c0400b00651679bd35fmr9932521qvb.43.1693837344652;
        Mon, 04 Sep 2023 07:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693837344; cv=none;
        d=google.com; s=arc-20160816;
        b=HnyBgfzIDgD9ryWUkhF2kwy/xP967nSfs/FjtaG8iAwUWL4onuJXDADBbVlg7Ltf7t
         eRoz4XNIPv3U447IE9fM17wOtGonntQIRyQQM7glmcR5xpvvRrbgdgxXw0rIsJ+IkQ5Z
         is42WlaEhtwOIsUkFZ5v4GZ7TgzxzfZz9sGBNZliyF8S1KSWNvgwuubxSXKE96hIIVNH
         +sCOKCwaNhlSHMgfXVz85EIRY/AL6RdZ2M2Kiw0XvzZNcR1j1GHvodyj4RQUYIWpvkI7
         Dn6C+xavYNOKoEjN6bCrMij69uZBHZ/tqkBD6BPa2WNwhp7LMdn4W6NeWl8biD55e0R7
         hffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RWvLz8BVYIumQ4/T1XxOpStetVPA0USBRzqlFOyXLAg=;
        fh=W3EgVUuhcAzjd4c33SPH5S4oJyApz1ChrU4InAB1hP0=;
        b=tvb3GCZx5CYzPsSBv2lft9jIGhRUtn5lb1VTWYq+p8qZsllDRZa1yo0/Al400psc54
         iVbNMqXsXB3fnLFf/renAlFS/W3NOKoIg66ReRqCIpF8qJKU+YhVefm+j2u5C4VnSmlW
         Yyzws2y4EJcLg57PUd0JAFk/CnLie5nmmO/Zbt6pFthpWrG6IMnIfPJTNfJ0QMj9lwNM
         +12Ibed8vggHXUwr1y6ZDEoar47UfgHikHc45dAcksUPBazgjguOjTfJ4nQalkzyVqO0
         FSNGHSAdUketO+RivJ0jICw5X+ctqBl0bmix49Ut1XUb8yj0w9u6LgZD0MlHinn1gSlM
         lniA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AqhWQY7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a0c8cca000000b0064a4279495esi6500036qvb.507.2023.09.04.07.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 07:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AqhWQY7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdASk-0003UX-LK; Mon, 04 Sep 2023 10:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdASh-0003Tk-Kp
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdASe-0004wT-RB
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693837311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWvLz8BVYIumQ4/T1XxOpStetVPA0USBRzqlFOyXLAg=;
 b=AqhWQY7newzybx1pRjHF2zAtqRLD04umYZiXiydqCiQ/M367bHoyl5Ngi2Rlc0mw1wPnkb
 pejC0uOU16uIdXkj6uOfiYQCZUvNSyPBbUgJ1fEddVVcxW0P9TLJJquArAm42HFh+UKtvc
 7syMRuIyaw13f3Btzy5rZNNRrnGHzgM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-h-4bLKN_PSmfeWMi272VRA-1; Mon, 04 Sep 2023 10:21:50 -0400
X-MC-Unique: h-4bLKN_PSmfeWMi272VRA-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-64a459efdbcso18038156d6.3
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 07:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693837310; x=1694442110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RWvLz8BVYIumQ4/T1XxOpStetVPA0USBRzqlFOyXLAg=;
 b=H92GwoHg8ROjIEOzDI9sCkzw/8c6TDrUBWU6v3gMMBVKMxOqcSGRv1+ubhFevgmlIn
 8TgYs8HtKY6uRr4KLmNyHZzrpmSVee/5tKWTK0J4j+s2WijM4ILvY7eGAc+VMj5plMfM
 007WGNiYSC0gsuYlN4xBWXybkxN4M96Qi6pSJamE/6286FrGZxv82B2+k62UTwxwXUgM
 dkFSzTR69QEnykoDsCnaotHgbrKWoqfsAmK23cjBXpDuwkczieYUuYApU5tpKussgD9T
 9XEgKU+Cnena/q4aKVkv4N5vy+6wyDpV+DkH5ODK9veqAfbB1NwId+bvqKtpItdjDdJw
 crUQ==
X-Gm-Message-State: AOJu0Yx8ggiToc/ii3WfCVDM3Gfnaz0p3L+OYnGSVmXM0a/Y1iipiq4J
 mB/upDWyY+kSAFI10+0tSTNusTN6uOR+zZy19j7DUWLZUGsczJAvxQyKC7Y4KYpRsKfeRfGYH2W
 07BDYHETQi/tv
X-Received: by 2002:a0c:e2cd:0:b0:64a:b51c:8123 with SMTP id
 t13-20020a0ce2cd000000b0064ab51c8123mr9838848qvl.8.1693837310180; 
 Mon, 04 Sep 2023 07:21:50 -0700 (PDT)
X-Received: by 2002:a0c:e2cd:0:b0:64a:b51c:8123 with SMTP id
 t13-20020a0ce2cd000000b0064ab51c8123mr9838838qvl.8.1693837309937; 
 Mon, 04 Sep 2023 07:21:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a0cb292000000b0064f5daff23fsm3650038qve.15.2023.09.04.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:21:49 -0700 (PDT)
Message-ID: <1851c339-949c-24f0-78a3-ee4aaf62afb4@redhat.com>
Date: Mon, 4 Sep 2023 16:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/13] range: Introduce range_inverse_array()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, jean-philippe@linaro.org,
 mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-7-eric.auger@redhat.com>
 <91d32bd0-73bf-ee50-ccd1-bd010a4263cc@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <91d32bd0-73bf-ee50-ccd1-bd010a4263cc@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: saAGK4JmEDOj

Hi Philippe,
On 9/4/23 10:18, Philippe Mathieu-Daudé wrote:
> On 4/9/23 10:03, Eric Auger wrote:
>> This helper reverses an array of regions, turning original
>> regions into holes and original holes into actual regions,
>> covering the whole UINT64_MAX span.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/qemu/range.h |  3 +++
>>   util/range.c         | 35 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/include/qemu/range.h b/include/qemu/range.h
>> index 7e2b1cc447..fc1d3dabe6 100644
>> --- a/include/qemu/range.h
>> +++ b/include/qemu/range.h
>> @@ -219,4 +219,7 @@ static inline int ranges_overlap(uint64_t first1,
>> uint64_t len1,
>>     GList *range_list_insert(GList *list, Range *data);
>>   +void range_inverse_array(uint32_t nr_ranges, Range *ranges,
>> +                         uint32_t *nr_inv_ranges, Range **inv_ranges);
>> +
>>   #endif
>> diff --git a/util/range.c b/util/range.c
>> index 098d9d2dc0..11c4ff0b78 100644
>> --- a/util/range.c
>> +++ b/util/range.c
>> @@ -70,3 +70,38 @@ GList *range_list_insert(GList *list, Range *data)
>>         return list;
>>   }
>> +
>> +/*
>> + * Inverse an array of sorted ranges over the UINT64_MAX span, ie.
>> + * original ranges becomes holes in the newly allocated inv_ranges
>> + */
>
> Most of the functions are described in the header; could you move this
> description with the declaration?
this is the case for all static inline primitives but not for
range_list_insert(), hence that choice. Now I don't have a strong opinion.
>
>> +void range_inverse_array(uint32_t nr_ranges, Range *ranges,
>> +                         uint32_t *nr_inv_ranges, Range **inv_ranges)
>> +{
>> +    Range *resv;
>> +    int i = 0, j = 0;
>> +
>> +    resv = g_malloc0_n(nr_ranges + 1, sizeof(Range));
>> +
>> +    /* first range lob is greater than 0, insert a first range */
>> +    if (range_lob(&ranges[0]) > 0) {
>> +        range_set_bounds(&resv[i++], 0,
>> +                         range_lob(&ranges[0]) - 1);
>> +    }
>> +
>> +    /* insert a range inbetween each original range */
>> +    for (; j < nr_ranges - 1; j++) {
>> +        if (range_compare(&ranges[j], &ranges[j + 1])) {
>> +            range_set_bounds(&resv[i++], range_upb(&ranges[j]) + 1,
>> +                             range_lob(&ranges[j + 1]) - 1);
>> +        }
>> +    }
>> +    /* last range upb is less than UINT64_MAX, insert a last range */
>
> In order to use this new function with variable range sizes,
> can we pass UINT64_MAX as an 'inv_range_upb' argument?
Indeed I hesitated to bring enhanced comodity by letting the caller pass
the upper bound and allow values less than UINT64_MAX. But I was afraid
this would complexify the implementation, hence the current choice. I
will have a look & see.

Thanks

Eric
>
>> +    if (range_upb(&ranges[nr_ranges - 1]) <  UINT64_MAX) {
>> +        range_set_bounds(&resv[i++],
>> +                          range_upb(&ranges[nr_ranges - 1]) + 1,
>> UINT64_MAX);
>> +    }
>> +    *nr_inv_ranges = i;
>> +    resv = g_realloc(resv, i * sizeof(Range));
>> +    *inv_ranges = resv;
>> +}
>

