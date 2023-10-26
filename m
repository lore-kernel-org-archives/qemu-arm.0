Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp142263ejb;
        Wed, 25 Oct 2023 22:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/EmEeJmhvaBexwiHN4eNDYs//4Ga22HjKndgp9VfhgCIxVmfQPe/g/EYk9NKIm5F4B/Zi
X-Received: by 2002:a05:600c:470f:b0:408:3fae:d809 with SMTP id v15-20020a05600c470f00b004083faed809mr13013581wmo.17.1698298800100;
        Wed, 25 Oct 2023 22:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698298800; cv=none;
        d=google.com; s=arc-20160816;
        b=HZAc0aFhnYOdxMp+QUeGgt25pzeaeDRzADBEru/RY4IdURviL4lFINKyVK/T+Rh1SL
         SSHtVkPwKMUD69dZli1c/UXus0oKavCSOdboQywDp7BppTof1hdK5ML+uIhR2MUS0YL1
         1EDQW1fzOK2HmIZ9NJyKBsuX23kWPQKbRSKXO3NCvlJDb1aj9VRrz4Y0VmMwE7Bk6FRG
         5hFjYYFtftDuGxw6K0dZ0WglJaOdgZKHcyT4sE58Kqeot/RP4w2cIZTDJjhI4hZHIKIE
         j0V/DgZRm3LFlqSvT0/cZVcfp0d3DWnO3dIB1Wf/kNyrPdW/KX0bEolx4UG/RzVP3iXD
         wx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WKC6VSyhoQgtZmNIF/6QVl6YJa1z+kbcOO1dX5uuVCs=;
        fh=0zTg7JqpEkRv6PpnFgWax7BLxT45hIRqZHSy67B+2mI=;
        b=xTxKFtnRCKByik/CSFt0sOuhVz1GGR6J6rPlNPEODWiyNE73oDX+YUyzF+yF3JWJDn
         28rAYrTgFCscuBEdNijfA/pvIiKrLE72bvXX5mDQZl7AE+3+F90Om90nFPRUkb5Gide+
         Tz19t240SFDwWpCwjnqACr0x1HDOmmtFwHUbjgTrVv4Fx7A480+ne6250u2fDBxcYYZw
         kGIN3kbAL/6LLQ4KtkSNXIzmqtWK5xwgC3bQ5R8I8njge+ZQ1poIwuaN+I07rXllGrqE
         tLhXceQc/YVba64KDaZljZ8wCjdZxSFJcm0lFWzPGcwn4LDSltml4S8PkxginjVcqoIm
         eHnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N0TEVj3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020adff98a000000b0031f950265f0si8622167wrr.196.2023.10.25.22.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 22:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N0TEVj3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvt5z-00077c-8b; Thu, 26 Oct 2023 01:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt5w-00076h-F2
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvt5t-0005eK-TD
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 01:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698298784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WKC6VSyhoQgtZmNIF/6QVl6YJa1z+kbcOO1dX5uuVCs=;
 b=N0TEVj3Pb77oj+tGy6MbHXUXxZTJklBXKpr6qhAhZoi5hQPj2NYSmaeogyFD7fHVXsXkl3
 UuDz3cwtXToaqTQ4JaIsnfpMR72pOqE8+XYXfWG4bFi6TRS4MRC4seGVuEab31ZWm9AORF
 CFhwmM02C8MqqEYUcF4S5PDOk6gYT68=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-In0gByCoOvCVkRgyrFIfUA-1; Thu, 26 Oct 2023 01:39:40 -0400
X-MC-Unique: In0gByCoOvCVkRgyrFIfUA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-507a04c6fdcso458875e87.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 22:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698298779; x=1698903579;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKC6VSyhoQgtZmNIF/6QVl6YJa1z+kbcOO1dX5uuVCs=;
 b=LBm7NtOrpUGbrhBV56tJDqoq/1n+T5bEEAB9sx9T9v35707R+S2mjR8GOw6CAEIdxr
 vN9S9GrdClgIh6e0QF1bMnsuDcOpM6zcVCxqhtq4k+utMGOpMlz/Hg/T1FWXAM+WHRBq
 UF6JMm+q5UmoOHqLa04w8TZ1Tg5D1HyLMKijQSu709WgkafFhbrIwR7KTlKCCnvWTb16
 pKVmK0wavilsVt5jKJ+ypl4RrVa9a1+uEfS2EqYZeNBWt//PEy+39gPovhK1glxVFNqp
 BRt0ufTsySOQTGlhdieiJuFqQkfLXDBw7U3ecmSJwWQCJphf2jvp2XfHAfRpCbOQVOvx
 pnsQ==
X-Gm-Message-State: AOJu0YxKlw0LePouG8nuT8w5j8yg2Yw6PoaQoP5OTV6r0BXdj6qLa9LJ
 ogaL6GueRKd5IzgAj6Ab3msJ246jQF3W6mukKHqKvaN85ccfhZfw9NXtKzeV1dEZEkG7kr7nrfk
 pr38Z7GVU9UYV
X-Received: by 2002:a05:6512:31c5:b0:508:15fb:d419 with SMTP id
 j5-20020a05651231c500b0050815fbd419mr4089680lfe.57.1698298779216; 
 Wed, 25 Oct 2023 22:39:39 -0700 (PDT)
X-Received: by 2002:a05:6512:31c5:b0:508:15fb:d419 with SMTP id
 j5-20020a05651231c500b0050815fbd419mr4089657lfe.57.1698298778884; 
 Wed, 25 Oct 2023 22:39:38 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 i18-20020a508712000000b00536ad96f867sm10845721edb.11.2023.10.25.22.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 22:39:38 -0700 (PDT)
Message-ID: <4b2a7827-b0a0-4cd5-81a4-d4129a53ac82@redhat.com>
Date: Thu, 26 Oct 2023 07:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/23] ui/gl: opengl doesn't require PIXMAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-16-marcandre.lureau@redhat.com>
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
In-Reply-To: <20231025190818.3278423-16-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
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
X-TUID: LfRTCbwqLOLW

On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The QEMU fallback covers the requirements. We still need the flags of
> header inclusion with CONFIG_PIXMAN.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/meson.build b/ui/meson.build
> index 3085e10a72..7c99613950 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -60,8 +60,8 @@ endif
>   system_ss.add(opengl)
>   if opengl.found()
>     opengl_ss = ss.source_set()
> -  opengl_ss.add(gbm)
> -  opengl_ss.add(when: [opengl, pixman],
> +  opengl_ss.add(gbm, pixman)

I don't quite get the above line (sorry, meson ignorant here) ... does 
"pixman" simply get ignored here if it has not been found?

  Thomas


> +  opengl_ss.add(when: [opengl],
>                  if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
>     ui_modules += {'opengl' : opengl_ss}
>   endif

