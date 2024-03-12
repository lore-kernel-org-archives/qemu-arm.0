Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1736086ejc;
        Tue, 12 Mar 2024 03:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXr+Ywn+zo5p1b317f7Vx6pCh4fhq+r6A5Z/FUIOwaKtM21CGvtLIDxnB9hcLzdmxNjrOyyw1Xp6A7sOuH/vyC3JbYuCPDd
X-Google-Smtp-Source: AGHT+IER2FSRasfSl3RZPT/tCbT0nSN9Djfo35DLozvq+CB+DI1g+qAyqhfGCxbeCAvZNNTPk9qI
X-Received: by 2002:ac2:46cc:0:b0:512:fce4:327b with SMTP id p12-20020ac246cc000000b00512fce4327bmr6025052lfo.39.1710241115429;
        Tue, 12 Mar 2024 03:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710241115; cv=pass;
        d=google.com; s=arc-20160816;
        b=l7Kr7X9bwU1fG11Itw1tPM7j/QUh9+EEqPj8f44Y3sClKV57QIuDvFEVrPyQRItWkH
         GOm7RLK1Loq+yxzUlAezn2FtRnU2i2WAUN9DN7QkBEeYSG0g4/SHnm8YVHOYLPO9uZOZ
         QvHUtxbvnwi7FQs/yKxiqhIN5JYxrvpLJp9b6OeUdm0BBsiWhQbtm8N+5HDhA5b8nZpx
         9mw3/kRpaCzZMCQeUGbYc+6cmfLSy20VV7WwEKzp6r2v1hfsO5llBiwzsUPRtI2eaHfQ
         0k/bYJvwr6i5ay5fSXGCl+72LAoCsLba5i2fPmh4+MkPxGGSzGErWG031Ywjp1gPB5Oa
         J/sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=t09QWsY94/iQRZOnzLkiHhhxO2pFYnVJQ15R56gTi90=;
        fh=AGkhqE01oIRMdFq1LF6y9ImuvsvD7f+/mvqApGUyN0s=;
        b=jUmUpfZm9/rEKDuouIrK5Btj7Rg4wRP7ThhtyhQx/orJ3jCOL1HFr07aektwTVyvzz
         XHI6E2ZVN4GaYsSQaVmtYTyA5Rl0kbmF6lqfZ/gLFzCtsI79StOa5bFjm7jV3WGn33dO
         NhXkPFyKBRr8QBeDaPO0fQG3u41YGbxOMjU96ox/JVA1XGzNSuoaEraNsET0KCpa159Q
         Kp505CWPjRrvylRjteiyGqJ7+ebOMARp5GDWVjxIHmYLjoD4LCGEX4m/doid8GzhU/xe
         guIarp1OOUkIMaKM/Nr1eTVULM08Jww9WeI7EaXPI3x8esC2TUo9P/z2wQRSzNpf6swT
         bvGw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BgyxbMxb;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id x14-20020a170906b08e00b00a44f9cae2a3si3359308ejy.103.2024.03.12.03.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 03:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BgyxbMxb;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-11655-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5851F22BFA
	for <alex.bennee@linaro.org>; Tue, 12 Mar 2024 10:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C8478683;
	Tue, 12 Mar 2024 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BgyxbMxb"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB207867B
	for <kvm@vger.kernel.org>; Tue, 12 Mar 2024 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710241109; cv=none; b=gSCt09Z4zFQkGkz6KlRmUAeFxMowQSBs+ntNfbX/1wgXjAQe4AZm+vPnDdiT2NMD7lvWfbcQ9aznYWeq/dVmqzZDt058EqD9xmn0vH+Q9J9hyLmF9UlIUuENBLlBPHNiJbIm1NirZpO18krf9CyYYxEHoG4oY1y8jBVxSti/S4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710241109; c=relaxed/simple;
	bh=Q8Dgw/C7BG8EC74cuMCnn+e4NATopHOcjiowX+B0+UU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f86ZYMgMwb0tSsxZ/eOMIjvdkDOqgli1c99h3Go/c9/mdtM6pVeV41bBAVWXDTwZ2L8b8HeBM28aose74Gp9v7Y55Spot7Zei1mR0NCkC86t0mQophsjR+vuH+G/oqN/y6T0t4G9fIND0LuY2j5ZsuNnV80+36abEWDJU+X7VVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BgyxbMxb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710241107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t09QWsY94/iQRZOnzLkiHhhxO2pFYnVJQ15R56gTi90=;
	b=BgyxbMxb3jQ35lmwDpAGeB357iXNYCu3OuRnaa+7+DEf/OoG9u9txdp1WDhRVNU7lhENlt
	WkQV++jrUMEf7r1TxavP6wXQdFRqEeJzsSOp8JMOBhDn02A2FhvUMAm0x/A2tdQTMhIjSj
	rF+iIM0qyvjr2QfGxerGm0jdfgs3Ry0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-19jcouNeN3qPmrHTsNKH1A-1; Tue, 12 Mar 2024 06:58:25 -0400
X-MC-Unique: 19jcouNeN3qPmrHTsNKH1A-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7d2d72f7965so2692945241.2
        for <kvm@vger.kernel.org>; Tue, 12 Mar 2024 03:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710241105; x=1710845905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t09QWsY94/iQRZOnzLkiHhhxO2pFYnVJQ15R56gTi90=;
        b=vmjvpExbx0ftC2Djm9WM8DTtq9EbvLh6NH7bVRX1ZgUjgcFYG/w+lDNl6gl61xyj0B
         C+k4+fyZXktXxlVW79tt/UbT4+FwwAEY0kZUDbW4d7PN9MDti65yjHv5JU04o4rzt9ya
         b5+YMijaAxum1x5QW0VacxgFNQP63I7pVfOyq4ITrs4T5WyYvDiwVlJs/wvcw9WbbP27
         hh5qJwjPWfnNkRF7iWm7SH9w+EzZQMj1qwv8PGyia5ZNp6hjgwFZ1uwFOjw+byNE2lKs
         yoUm5N8dcAk9UAr+YT1iHTykQlYyy4rChnBmH/t2OXQX5ps+cw5kfXRwWPlvhDt/wxS+
         SrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3urL2vn0oxBh9l+Sas1YtjRA/QxAxHgNVonzx3WIHSzrNvGAKegG+Rfif5knHvO3Bc9deeZxCNqQBW3NsL1L+Mmbh
X-Gm-Message-State: AOJu0Yw4A8iAtVAgnoPg9wHBPsiIyPWLcZep0RIpe5xUSY6e8/RP+dE8
	efagY0PUNdTaYRsDSmhlo0cZSkK4nYbw6k2QMwdTyPImnKxaVUYnUVuVRH7paxOhSilLBjTroLi
	8H5O2ZNX9V8IeLJOZnv4TS7U4YLWEbzLY4/7GODp2UcTGP+7oHQ==
X-Received: by 2002:a05:6122:1689:b0:4c8:e834:6cf2 with SMTP id 9-20020a056122168900b004c8e8346cf2mr5391226vkl.3.1710241105312;
        Tue, 12 Mar 2024 03:58:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1689:b0:4c8:e834:6cf2 with SMTP id 9-20020a056122168900b004c8e8346cf2mr5391211vkl.3.1710241104988;
        Tue, 12 Mar 2024 03:58:24 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-86.web.vodafone.de. [109.43.177.86])
        by smtp.gmail.com with ESMTPSA id m14-20020ad44d4e000000b00690d26a6b20sm1893400qvm.130.2024.03.12.03.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 03:58:24 -0700 (PDT)
Message-ID: <db5a73f5-bccc-4595-b1e9-4ed5806e3884@redhat.com>
Date: Tue, 12 Mar 2024 11:58:16 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] hw, target: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240129164514.73104-1-philmd@linaro.org>
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
In-Reply-To: <20240129164514.73104-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jXgmM4COri8C

On 29/01/2024 17.44, Philippe Mathieu-Daudé wrote:
> Patches missing review: 1, 2, 5, 6, 8, 11, 14, 15, 29
> 
> It will be simpler if I get the whole series via my hw-cpus
> tree once fully reviewed.
> 
> Since v2:
> - Rebased
> - bsd/linux-user
> - Preliminary clean cpu_reset_hold
> - Add R-b
> 
> Since v1:
> - Avoid CPU() cast (Paolo)
> - Split per targets (Thomas)
> 
> Use cpu_env() -- which is fast path -- when possible.
> Bulk conversion using Coccinelle spatch (script included).
> 
> Philippe Mathieu-Daudé (29):
>    bulk: Access existing variables initialized to &S->F when available
>    hw/core: Declare CPUArchId::cpu as CPUState instead of Object
>    hw/acpi/cpu: Use CPUState typedef
>    bulk: Call in place single use cpu_env()
>    scripts/coccinelle: Add cpu_env.cocci script
>    target: Replace CPU_GET_CLASS(cpu -> obj) in cpu_reset_hold() handler
>    target/alpha: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/arm: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/avr: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/cris: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/hexagon: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/hppa: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/i386/hvf: Use CPUState typedef
>    target/i386: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/loongarch: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/m68k: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/microblaze: Prefer fast cpu_env() over slower CPU QOM cast
>      macro
>    target/mips: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/nios2: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/openrisc: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/ppc: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/riscv: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/rx: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/s390x: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/sh4: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/sparc: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/tricore: Prefer fast cpu_env() over slower CPU QOM cast macro
>    target/xtensa: Prefer fast cpu_env() over slower CPU QOM cast macro
>    user: Prefer fast cpu_env() over slower CPU QOM cast macro

FYI, I'll try to queue those for my PR today except for:

  scripts/coccinelle: Add cpu_env.cocci script
  --> Still needs review and you mentioned a pending change

  target/arm: Prefer fast cpu_env() over slower CPU QOM cast macro
  --> Needs a rebase and review

  target/hppa: Prefer fast cpu_env() over slower CPU QOM cast macro
  --> Needs a rebase

  target/i386: Prefer fast cpu_env() over slower CPU QOM cast macro
  --> There were unaddressed review comments from Igor

  target/riscv: Prefer fast cpu_env() over slower CPU QOM cast macro
  --> Needs a rebase

  Thomas

