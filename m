Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ADDCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 18:19:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8jcA-0000tU-WA; Tue, 14 Oct 2025 14:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8jc9-0000t3-Aa
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8jc6-00080q-S8
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760465947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BhpgFY4LwiuKePr+EVvOD9fACdNwCXyrctCHfHZ+FIU=;
 b=L1bxhrVcgmgTPX2Umi/XOLwxagEdLBTPU1ZNpb7ASt6tuJNHz9HGXSSxpGSSBVJWWBQJ7O
 mpGDwrVtxMRecVgmCKbzj52PyDPYPeiJpi00zt7y4n38nMQ6xBlnZff/DWK4M40NdGTVxg
 f0UYgP/GgDc7dhzJQmUY/EMKRYsImEE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-fFc9IIs-M8eTDWwIS6IdrA-1; Tue, 14 Oct 2025 14:19:06 -0400
X-MC-Unique: fFc9IIs-M8eTDWwIS6IdrA-1
X-Mimecast-MFC-AGG-ID: fFc9IIs-M8eTDWwIS6IdrA_1760465945
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4256fae4b46so3952437f8f.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 11:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760465945; x=1761070745;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhpgFY4LwiuKePr+EVvOD9fACdNwCXyrctCHfHZ+FIU=;
 b=W2RCX7kG8u9V8LGbvIowpZSrIufEg35Pu8348R0+BwwbI1mulk8BfG0O5FTavQ01q8
 f/e5V3Ya/9BApQ6u/FeJWwEdhMS0pH63JKQ0YBsRfb38jWRju1ARHTZPv1fWr0lFjfz0
 lV3stDpz0md1kGEopRlaBkCdNuMQ62p+ngF0a/U2PVZdDOdmbOz/UhrYOxkLTfnGZUOw
 YFbkYai+NgYfWMdTisUlGf+z7AnV65TQcfIqR6r2USnEFkjaFUOnja2XlU7ODlzSxJpB
 NkAwG7uX9Th8wcvojUa1VJOJkOtuTyHMhWgelsIBRLjBPl+aerPWCYR4h7A1zPW9doyw
 E/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNmdl8FcEL3A4Qzhn5jrZcxHUsnsw+EPcKGmedCKATGfHrqrPtkAfbjjUwg9j009/01/FOH4zT6A==@nongnu.org
X-Gm-Message-State: AOJu0YzwgyaXKN6r2l4PnnYV9ELIRWEHjwTo16FfPNVTVD29k46hMSie
 EEZ1lFkl97Sb/7/gKlN/pTB3247s3ocgKjglJAOAl4+Bz7yDKOHMacFGoFoEBC1ScEHiUhgcGic
 2PAoL4wpS6p4rto0kzuTv7c/rTwCGXrHDXoN4kYEskOvlCkLuCh2jfw==
X-Gm-Gg: ASbGncspwjMztoNUEOjPXIohBTb81vAzBoRHnRLBLCLIuFXeu2UktPMCh08xfzdjD8p
 ZHLjggvOrvijLVos2/8wReogwcQPpZyqYVxX/0ADbG4dU8Oqq6GZzqigBAb31nXkLkf8QLEoxKV
 hme20JJk6J1L9UfWHvRwWkg8DiIFJ0G9okioluDnh0eXJ9xq28WXaQxIJik4BnC8slqKkB9wxTX
 C2QajOR8gOmNxvFquwbU+Oeq8n9X7bSyedRHoMLT9AGKQ9cVd0Unf4xTBidOwXkfKqWx5jyp/5m
 izj3yWvNDEjYbQaRkKOfgMFdbcjob4ZD6RboJTCbSYFn4SZG9tzWaqhGYrC6DuOt/q0FEcTZCqI
 QpuiHWg==
X-Received: by 2002:a05:600c:870e:b0:46e:35eb:43a with SMTP id
 5b1f17b1804b1-46fa9a9f16emr192093135e9.15.1760465944731; 
 Tue, 14 Oct 2025 11:19:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWr+ozzSJ+gbFVhc4vxItT+LcXkPpNu/pb0JOGKck4KVSZMtlMM0wMSDA/lKfWmOejWV3OCg==
X-Received: by 2002:a05:600c:870e:b0:46e:35eb:43a with SMTP id
 5b1f17b1804b1-46fa9a9f16emr192092915e9.15.1760465944276; 
 Tue, 14 Oct 2025 11:19:04 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-136.pools.arcor-ip.net.
 [47.64.112.136]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab36ed3bsm169164735e9.0.2025.10.14.11.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 11:19:03 -0700 (PDT)
Message-ID: <c32612d4-3def-47b3-b32c-fbd1ec527012@redhat.com>
Date: Tue, 14 Oct 2025 20:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] testing/next - arm custom runner tweaks
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-s390x@nongnu.org,
 Liviu Ionescu <ilg@livius.net>
References: <20251014104323.3023714-1-alex.bennee@linaro.org>
 <c5003498-7914-4d94-bb79-0851c49c47a1@redhat.com>
 <874is1l7db.fsf@draig.linaro.org>
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
In-Reply-To: <874is1l7db.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ofdvNPQyI3JlHKGpuonALSmUtCvY56FY05kMP3vwhhs_1760465945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 14/10/2025 19.29, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 14/10/2025 12.43, Alex Bennée wrote:
>>> This isn't quite ready yet as there is an in-flight MR for libvirt-ci
>>> and the final patch has to manually drop a couple of packages which
>>> don't cleanly install. I don't know if we should deal with that
>>> upstream or in the lcitool metadata. For reference the two packages
>>> are:
>>>     libcurl4-gnutls-dev:armhf
>>>     libglusterfs-dev:armhf
>>
>> FYI, glusterfs is deprecated in QEMU since a while:
>>
>>   https://gitlab.com/qemu-project/qemu/-/commit/b873463821343c6f702c4195f2168790b09cf44e
>>
>> ... so you could also add a patch that removes it from QEMU now, I
>> guess.
> 
> I can do that.
> 
> 
> Richard and Phillipe reminded me that we are due to drop 32 bit hosts
> real soon now so maybe I should just remove the runner and the hacks
> needed to get it working?

Let see ... the last time I tried to deprecate 32-bit arm, I've been told 
that the Raspberry Pis still use a 32-bit OS by default:

  https://lore.kernel.org/qemu-devel/F852C238-77B8-4E24-9494-8D060EB78F9F@livius.net/

... and the right time to drop 32-bit arm is when most Pi users install a 
64-bit OS by default:

  https://lore.kernel.org/qemu-devel/379B4C23-61C2-4AA3-A851-EEFC98A9AFF6@livius.net/

So looking at https://www.raspberrypi.com/software/operating-systems/ now, 
it seems like the 64-bit version is the default nowadays (at least it is the 
first option there, and no more recommendation for the 32-bit version), so 
yes, it's likely about time to get rid of the 32-bit arm hosts now!

  Thomas


