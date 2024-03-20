Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1754099ejb;
        Tue, 19 Mar 2024 23:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU66eApTCKv9l/NI9wQS3vhVKhuUr+FKZkZrFLI9bpv7XM+6pvmCJrpRrnitil0QCqG0AxxqlEZ3o+6i9yt/rKbt/v0/ozN
X-Google-Smtp-Source: AGHT+IEE/sNQaQqOBXO87OQWOhR1UdkWl3zNc1VZI9o3IOs5Jg94o6267ieTWoA8AlNsJ/feJ5jg
X-Received: by 2002:a05:620a:21c9:b0:789:2b98:48a9 with SMTP id h9-20020a05620a21c900b007892b9848a9mr1078409qka.27.1710916804007;
        Tue, 19 Mar 2024 23:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710916803; cv=none;
        d=google.com; s=arc-20160816;
        b=M7BnQ/TiopWT2jZPEHy8DdwSPjzSVzkAFgRY4LzeCKW0OjEPfX4FmymT92EPWS2nhb
         OAIIjpk3Ak7sr2OYlIDxC3upmvZ8pKQ58kjsiBoUQhjcW3FaHO/clXMWPYC1EOshap+u
         1dcEWf9pdAcp7kcdgTQI6tbe/2/y6cgyUIzF/57VvrZ6FWMD7MSDp4UKAjR5YM3XIIWz
         DeabWPjCFx9bU0kj9DY23OvfG895prFnT0frB+b7cpb9jKEihQqFFZeKdXQT0Bb16UQQ
         ICFhYGUA2dnmOwPEwQ1qIm17rOoR7UnGxpC0e4kKGLbmWdzbajLsxuH16pNIMZORMHwb
         JXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ufm/Y1EoFMvkpl5VIargUW/JSv/syJHhyz9ubvjSrDU=;
        fh=1NeGklwP8L+MkYwf3oPO8fJFV9VBrPwRkT9lG9wudws=;
        b=qp3arLME9isn90C6NO4A6dS4lDrfNqLHDOse7iSWUXN/wa374G2beRWjmaaiHEP+ws
         w4fUGA0E5FjjsqjPiUGfgiUGaXDVhxaXFJ2m86iJO3QvLz4XBEhB3RvtvSucEuSrJU+H
         T7gO4eOjKpt6tAmZAGoxOe9LMxgGiV7XD5iQL0/JcdXC3qw+R8lg7fU0o6GE2NMaZinZ
         R1M7rxBY5226Ph7BeEh1wPWSJHzC+My47kQ2axMicn9U4/qU+8yDkhWCza4KZS3cs4z2
         D+p1SF/JY/K/tk4n24VB6hV/59tIIQTWDI8VA0+y8Ud1WX/uLq4NXA7/VozbjdIYyB/n
         M+cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HiVxkx//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05620a085300b00789eb47b56bsi9222015qku.296.2024.03.19.23.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 23:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HiVxkx//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmpbW-00082q-ES; Wed, 20 Mar 2024 02:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rmpbV-00082U-1k
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 02:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rmpbP-0006U6-36
 for qemu-arm@nongnu.org; Wed, 20 Mar 2024 02:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710916745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ufm/Y1EoFMvkpl5VIargUW/JSv/syJHhyz9ubvjSrDU=;
 b=HiVxkx//WJa7FXOXzgK4UL20WcW2h/mocIhdkA9qOs0v+KXK/wkZoimJpWzVR3n1yzeIkW
 N+NkOYcJ3rJpeEhvEcFqWsd11tnGdLuXGyeCODVRNiJ8JjuieXiEqdK2D+aMZt2UBqE+jO
 UUfrLyW+kJcB7KIerxDMjyAKDL72fuY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-tn9gbeigM8iElSgZ-JgkAQ-1; Wed, 20 Mar 2024 02:39:03 -0400
X-MC-Unique: tn9gbeigM8iElSgZ-JgkAQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d49ce3736aso34135821fa.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 23:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710916742; x=1711521542;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufm/Y1EoFMvkpl5VIargUW/JSv/syJHhyz9ubvjSrDU=;
 b=j1LHUqLp5tmyoqSmIeS4GXmFAnjQ+dQOGHAe84zS9OCWUEmBhwwg0U+3m7TblRxWil
 7tPoCr9DlY71mOat5K7QVwLT8kLJAZ1IB6WffGd8ZCqUUB1lT+4iWkO7F1b13lew0KX6
 PLN6NtV74CHBtffw2c5Lx+HgtkIarp9R9dEFUDGduXk9sQa0MlbAlQSn3Tb7+z8KxizC
 N0KoHajKKZBmcVGpvlnx9Pae0wYxIPSix/qKYLDnjvcy+K+5H87PTeUi12k51FLsx/mn
 l47atn7A1wS4yvsgcHOluQPvqzNy5ulIgHPMm5sHvIUD63qnkKKr1nwjlZXn25wOw7iH
 88Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyfy+p101i4uW7xW5ZdK4kp+pzY20PEw+CHKgdHxy+u0nP+D/qGqO/DEMS6dR94EQ5tRmFhfQQNxyOrikXYHEw2MCq
X-Gm-Message-State: AOJu0YwPIuEHNO6vvkzMaarucEayz/InipHh1UKZqaRByMf7oi+WrvU2
 FQMbe8c3fZnc1pat6Cn957fmLask5QWSP5j7aY38l+2YSQxPjMG0R5mieVn4J4s0GI//yDM24Fd
 Jh6tjrI4PJixosZiEOHZsENwsjk2MBG92hvTpIzsxH6Tfg37p1Q==
X-Received: by 2002:a2e:be0f:0:b0:2d6:8e88:5a8b with SMTP id
 z15-20020a2ebe0f000000b002d68e885a8bmr1160474ljq.32.1710916742098; 
 Tue, 19 Mar 2024 23:39:02 -0700 (PDT)
X-Received: by 2002:a2e:be0f:0:b0:2d6:8e88:5a8b with SMTP id
 z15-20020a2ebe0f000000b002d68e885a8bmr1160451ljq.32.1710916741723; 
 Tue, 19 Mar 2024 23:39:01 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-50.web.vodafone.de.
 [109.43.177.50]) by smtp.gmail.com with ESMTPSA id
 my10-20020a1709065a4a00b00a4663d3b2bfsm6876746ejc.217.2024.03.19.23.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 23:39:01 -0700 (PDT)
Message-ID: <ef7a95d9-4a00-466c-b05d-7d1264e89de2@redhat.com>
Date: Wed, 20 Mar 2024 07:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 21/27] target/s390x: Restrict TCG-specific
 declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-22-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20240319154258.71206-22-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FR+tPHIlP3BB

On 19/03/2024 16.42, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/s390x-internal.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
> index 825252d728..559c9f561d 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -398,10 +398,12 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3,
>   
>   
>   /* translate.c */
> +#ifdef CONFIG_TCG
>   void s390x_translate_init(void);
>   void s390x_restore_state_to_opc(CPUState *cs,
>                                   const TranslationBlock *tb,
>                                   const uint64_t *data);
> +#endif /* CONFIG_TCG */
>   
>   /* sigp.c */
>   int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);

Reviewed-by: Thomas Huth <thuth@redhat.com>

