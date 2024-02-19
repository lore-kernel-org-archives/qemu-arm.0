Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp718437ejb;
        Mon, 19 Feb 2024 06:21:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVekLk5RtERlSJUv9lfwTbrsNQ0/7uhS698wtzCiimwTvQ+6Gy/49dCIoKZjafzqTtxJlbc3r8RwSy9ktnsidCYPbl6qzsk
X-Google-Smtp-Source: AGHT+IGm0WKRyktuk04ShUtmh1QH5qvYjslWL2O954DG8rK5oAZaKXLVIc2VkN/M9WWinPhsBK/E
X-Received: by 2002:a05:620a:c8b:b0:787:4e73:13d2 with SMTP id q11-20020a05620a0c8b00b007874e7313d2mr6723887qki.44.1708352480125;
        Mon, 19 Feb 2024 06:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708352480; cv=none;
        d=google.com; s=arc-20160816;
        b=fVfEOhdg9jYnklo+waCHTawT1LVjApnsfGCsTfaOTUIwCX8SvLhZmH7xDhsNQJoDJ7
         D9mxsdBY8ghHJG2nOvhQvcx9L1j2s1i7L+nLekCy9fCzj85je2BgrhFnOtS9r1oJ5/0I
         C2NfAzxqY7A+Ucph0rAQQoeNyM7ws622xJ8N3kNOMPWdVimU2lHFtNlxn0IZy4hD3VzL
         n/84SNlvFQOHN9r+naNw3z0xxbjI8ZFIiMKXDjxjIIF6rgHvMkcmN1rB5NWNr1s3A9hh
         7V+dI51xekqqVrBx+bB+ODIfNKBmfmn0AgCl9X2iKatqp/UjW3AR/QjA2qQzv2y2zcgI
         ocDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=aUQ2JMLIVHpVte9U6jW+XZsF/MeL6vQZTZM7HcQExt0=;
        fh=mHB71qR0/LlLLXGMA76FOVNv2vYZf239+kZW9JczA0Y=;
        b=X/IHCG8twCssOr4OZ6IIEa9srFPOY39jhDdUQLDZ02C1wjir7EQb9pFDTLKADggmDZ
         kLcgVEO3A0bBonqXDLrXvtPY0MoGtK1sQe6WpAwund4Owg9FbaEQcwx64v0gEEnj0pVn
         2r7G0LuduYrbnBjtHgIul8M6hD7t7PHdzNU0i/qn9eiIWSvvAPjY+39HU5wxwHkJrNhO
         Phe4Lz/M4LvTAU3gedFaSFiOla3rQBQbOTI78Z+3eZEwlSNUJS0IeBD4zbt8Lj389Ezq
         5GCvKS/agj6F8Ovkz2HtovUpQ1fBiVo1otxheA7VBoIEqzzKLgI3lBgCxWc/+ZEOUv7w
         ivQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL5qBdQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23-20020a05620a12d700b007871be6741asi6424140qkl.560.2024.02.19.06.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 06:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL5qBdQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc4W4-00060I-5Z; Mon, 19 Feb 2024 09:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rc4W2-0005zc-3p
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 09:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rc4Vy-0001MS-JK
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 09:21:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708352461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aUQ2JMLIVHpVte9U6jW+XZsF/MeL6vQZTZM7HcQExt0=;
 b=OL5qBdQFFZXKmjUiVvRDZdvZao/m9UxgmSRCEj0a09AUG63PjZqJgLGJfbSYh3kfMZ+uwX
 KcS+4/dp6HLoX2iyvy/J0KBcZLI/PPJ/Y+aBNXlZMrLUkneEtCzQqeWJlJRu7itqgiRkUd
 42jgP/4BHWEjmz2mEOfD1IzSdWz6auc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-SENorvbdNzSwr0eQntLHyg-1; Mon, 19 Feb 2024 09:21:00 -0500
X-MC-Unique: SENorvbdNzSwr0eQntLHyg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68f38f3cb86so42985196d6.3
 for <qemu-arm@nongnu.org>; Mon, 19 Feb 2024 06:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708352460; x=1708957260;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aUQ2JMLIVHpVte9U6jW+XZsF/MeL6vQZTZM7HcQExt0=;
 b=sWICtnatDHe4hUPlfNUjU7Ndkiv5ruj2Rpnv2wW2SQrah++Jv0oyhWThWbrGUd8DAe
 NBBreDVXjkqj83jpAhMWyONPPluINvahhE3XGj3AFLpBkl+SoBqFkxLz47j0dJjmEOuS
 B/4x6jKHjBLfI2jNKeLagSv5/TFlZQ5a4vCY2TNnM8m3OUpmKJg+6KVlUKe6Sbn9Jq4V
 Le97vDgcwnaSzjJEZ52W5P4Pg4Af8zrc4cZ0r6mKVC+Wgr6wXMRSszoT+q6Cxab1mHdq
 m806fIOsabdmWKfKANqDVwATgiqVVYZ6VfYxDSwD9esaWQSxsjG+kGv7BRXFqAWA8Yx8
 QY1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/z4/XERFIsxN47tJIFtleC5gZeI6DEpgGp+DwCDz5m14UEMJWcL49BmWICIGNNX+FFAijpeSnwWLAPdlM08josqI
X-Gm-Message-State: AOJu0YyEZlf3pgin5VS/Kjz+oLURm7dE3RKkBEarh0tuEcSySk+fNq6W
 qwEoKHZMpEnSS0HPZnuq5bsHH0wP00gp9JWaHfYHy5FjRWXz9R+voSleyZyu4H8LYXdQhMx4dl0
 dEqcXptBCLrEMpKgmMFWrz76FkbO3Ixt8shjosR/OOS58pZZUJQ==
X-Received: by 2002:a05:6214:21e8:b0:68f:60fd:d328 with SMTP id
 p8-20020a05621421e800b0068f60fdd328mr4885065qvj.43.1708352459917; 
 Mon, 19 Feb 2024 06:20:59 -0800 (PST)
X-Received: by 2002:a05:6214:21e8:b0:68f:60fd:d328 with SMTP id
 p8-20020a05621421e800b0068f60fdd328mr4885048qvj.43.1708352459680; 
 Mon, 19 Feb 2024 06:20:59 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-48.web.vodafone.de.
 [109.43.177.48]) by smtp.gmail.com with ESMTPSA id
 mu19-20020a056214329300b0068f0a287159sm3279112qvb.87.2024.02.19.06.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 06:20:59 -0800 (PST)
Message-ID: <0c7c448d-a651-4fa9-99d1-b08fcbaf5d5f@redhat.com>
Date: Mon, 19 Feb 2024 15:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tests/migration-test: Stick with gicv3 in aarch64
 test
To: Peter Maydell <peter.maydell@linaro.org>
Cc: peterx@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Sebastian Ott <sebott@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20240207005403.242235-1-peterx@redhat.com>
 <20240207005403.242235-2-peterx@redhat.com>
 <13862227-d782-46fe-b10f-94587c74745e@redhat.com>
 <CAFEAcA-AVjn5JdG+6eBd69o5BiJjmA1G6i4F2wVPSmRSw-X=Yg@mail.gmail.com>
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
In-Reply-To: <CAFEAcA-AVjn5JdG+6eBd69o5BiJjmA1G6i4F2wVPSmRSw-X=Yg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.072,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: zyjN4V1axglO

On 19/02/2024 13.50, Peter Maydell wrote:
> On Mon, 19 Feb 2024 at 11:54, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 07/02/2024 01.54, peterx@redhat.com wrote:
>>> From: Peter Xu <peterx@redhat.com>
>>>
>>> Recently we introduced cross-binary migration test.  It's always wanted
>>> that migration-test uses stable guest ABI for both QEMU binaries in this
>>> case, so that both QEMU binaries will be compatible on the migration
>>> stream with the cmdline specified.
>>>
>>> Switch to a static gic version "3" rather than using version "max", so that
>>> GIC should be stable now across any future QEMU binaries for migration-test.
>>>
>>> Here the version can actually be anything as long as the ABI is stable.  We
>>> choose "3" because it's the majority of what we already use in QEMU while
>>> still new enough: "git grep gic-version=3" shows 6 hit, while version 4 has
>>> no direct user yet besides "max".
>>>
>>> Note that even with this change, aarch64 won't be able to work yet with
>>> migration cross binary test, but then the only missing piece will be the
>>> stable CPU model.
>>>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>> ---
>>>    tests/qtest/migration-test.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>>> index 7675519cfa..8a5bb1752e 100644
>>> --- a/tests/qtest/migration-test.c
>>> +++ b/tests/qtest/migration-test.c
>>> @@ -819,7 +819,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>>>        } else if (strcmp(arch, "aarch64") == 0) {
>>>            memory_size = "150M";
>>>            machine_alias = "virt";
>>> -        machine_opts = "gic-version=max";
>>> +        machine_opts = "gic-version=3";
>>>            arch_opts = g_strdup_printf("-cpu max -kernel %s", bootpath);
>>>            start_address = ARM_TEST_MEM_START;
>>>            end_address = ARM_TEST_MEM_END;
>>
>> Looks like the migration test now fails on aarch64 when "configure" has been
>> run with "--without-default-devices", since that disables the gicv3 in the
>> binary ... is there a way to check whether the gicv3 is available, and use
>> "=max" instead if it is not?
> 
> A QEMU for AArch64 with no GICv3 is of very little practical use,
> so I'm not sure it makes sense to allow users to build one like that.

Ok, if it doesn't make too much sense to build without GICv3, maybe a patch 
like this could be the right solution:

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -12,10 +12,6 @@ config IOAPIC
      bool
      select I8259

-config ARM_GIC
-    bool
-    select MSI_NONBROKEN
-
  config OPENPIC
      bool
      select MSI_NONBROKEN
@@ -25,14 +21,18 @@ config APIC
      select MSI_NONBROKEN
      select I8259

+config ARM_GIC
+    bool
+    select ARM_GICV3_TCG if TCG
+    select ARM_GIC_KVM if KVM
+    select MSI_NONBROKEN
+
  config ARM_GICV3_TCG
      bool
-    default y
      depends on ARM_GIC && TCG

  config ARM_GIC_KVM
      bool
-    default y
      depends on ARM_GIC && KVM

  config XICS

?

At least this seems to fix the the migration-test when compiling with 
--without-default-devices.

  Thomas

