Received: by 2002:a05:7022:ec07:b0:9b:2b00:a62d with SMTP id qj7csp3212788dlb;
        Wed, 26 Mar 2025 00:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWUe2GXyV/VO+Xx7W619OTilQA5NtCNMkUUgwE86MVADKOuIcrOCUdm6Vjb1+BQaJsQH0rbHOEYnPxDw==@linaro.org
X-Google-Smtp-Source: AGHT+IHc2I1xE5kJU0ruT06+u6OMbPmyLu5oJTyUH6d9LgZ0VFxNWOSvDlPaDN9DRQmsI1oDSG/8
X-Received: by 2002:a05:6214:230d:b0:6e6:64a5:e18d with SMTP id 6a1803df08f44-6eb3f294630mr258556756d6.17.1742972403197;
        Wed, 26 Mar 2025 00:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972403; cv=none;
        d=google.com; s=arc-20240605;
        b=WMfPtX01wG7ZBNC03dE5cpGY6Lbu9csS9tmxOqF8OTEKiqtGS4cjbA4sYMnhzUuJ7X
         OWF9985G8PNY+M5hHuKmhM687uR5FWkK5isKIoUukqZg27lfCxK8ryXgE7kLU2/SZcYF
         SNai/I8q2U7IzNDOXjK4OCK0asHcFPdQlGupgtD1dRg+GBmm5FdxRvQYGDUaBwSh5ANu
         pBoqU/iCLKi6AMqMxkeEW+znzDIFBWSRkpZPe7jqqbAVOGHdwTEOYkVeA2IzGpu6jzNH
         MDvdgXm0yeltZmV5vQOVULkPbKOYa6CjjcfVV2BFSvcRLQs2OQT38jdKrFlisRpnot9t
         Y6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=upBbkwKNQPCUPxvHK/qdB5cBUGle56/wiBSAY5T3o34=;
        fh=oUuSBMr/eN3cLz6OEPKDoZSaBkYLvu03fBIMqyfUIrk=;
        b=GyDQW4qK4ULTjzUrtgPPnbeHQ19bS5+q9z2u/DvDHXBmfA/j3kXLKZXQ21b7kWoBw5
         ne5lAvWgdMs5kY3pfCpYD5l93zwYqg8qL1qj5odDk3MvmNLBsubwht+ZnhY2FoLm0M+j
         5w2BTBY69oJRK+478sM2fJRQ1lzUrMDhzCTs3fV+831jbw3QB/C2aBCv6BQ/xi7/W0Cl
         aChAaNJ+tA1U8ebYedPM7I/adjoIpM372nBHFxvUZIhdO2msn8/bjrX7ebF5FzPo9g1P
         GCfFXjIZfCC+oRP1s3BH8bpbJjioOhAfwnki36LGDhYEBrkmTV/0pL3IDACUL0mZ/nJq
         WZ/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFvFP3QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3ef63638si112201436d6.154.2025.03.26.00.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFvFP3QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKjw-0006sc-D8; Wed, 26 Mar 2025 02:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKju-0006s1-LW
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKjs-0007LJ-Uw
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=upBbkwKNQPCUPxvHK/qdB5cBUGle56/wiBSAY5T3o34=;
 b=RFvFP3QDnaShCOnOU7zqBx008DcHNc4Mzx4cI8xEPpG/L8If7PDZFwWD+3L/pDGNAK/2ZM
 kaUSRHjdRXD/Jpk0LEd2f6T2ftXtF6uM5ndR/EUfGWWUIUmyWH2AahgURUNbqhpvwQsKuw
 lYMje1Ybq/bXKcQuyERS3zvSXTXD+p0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-GLITGhlwO-6KNJoRIa-1NA-1; Wed, 26 Mar 2025 02:59:46 -0400
X-MC-Unique: GLITGhlwO-6KNJoRIa-1NA-1
X-Mimecast-MFC-AGG-ID: GLITGhlwO-6KNJoRIa-1NA_1742972385
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5e6a340f8c7so5837352a12.2
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 23:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972385; x=1743577185;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upBbkwKNQPCUPxvHK/qdB5cBUGle56/wiBSAY5T3o34=;
 b=PBxzy6eMJbTnDtoOuu79cZAv24nqR/H8hCHtCdEWsbKvkAV50PCm0VTK5UtTcJ70Rs
 EOpqM79u2KMuTna9QVv29I/nRI6ecHhQvCaM6O4aWBJ/gm7JZ7lRuuuPNmzGI0CsCVHw
 QsgFd+mNFVy5CO1C+IOw5SvVxdg4faoXLainksL8NRDH0PLFWJ3F0PWUpe8VpXq1iJLo
 d81n+zNiwAxF+rq/wEr6ySinqGW2e+qgvI8FavT5gXe7xBwpiAvopTcWrq01BrTBExfp
 dEFfKZQZMM+KkD2PuV/33iAD1y8sONATwYGLn7jPFdA96SmdzqYwgfmK3AsrR/1EdrI+
 N5wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/OmI+MMQQvN+/0/HUx4YYZ+i2aNjZ6hT9uJkbydWl0Ak7MfZ+6QKMsJ988oAWvrvIAffqI1MVKw==@nongnu.org
X-Gm-Message-State: AOJu0Yz818luXeRMp0SintGIoDLZImseyqbgvtvD+dfa5g24LZvxEZlv
 T6TB71MCImVydp1uY+2L86InxVRNt9IlgxjXOVRh/2VsyB89vfpaik1a2qkQzonCEHLWWvp5JBo
 lDVV9DmHCoVMfG921MEVXPhpAVaKiFYgUP7yt+c92p968C7+7QQ==
X-Gm-Gg: ASbGncshz5A7fJi2qf+I2r4uIfIra6prXW7PSNd9uti9AznmSaDxNx8q6YbDChE4Tw+
 xKPkJ8VesHlBnWKNZtSej7wiKGbSHz+PBRdLqb7aEw/AawZBQfQmlZkdAKIRl95lSaIM880xkfI
 6pNb8gyLpbyNVYVgtElbTMixORfRW53lnmFQW4TCZakBYaYAO1DOs3/2FAmq+1UTuHDpVf8Eknq
 cQHJuqFuHLeJAup30J3plqxdWFlhg4DBYfUI4rcibWh9V+1YmnvXMf9WNcyjhrIIjvVlrJPPtfv
 1yCCjFcerrb2pqXref1qynovPpp2vVREcYjpvf7JulTurwk=
X-Received: by 2002:a17:907:c5c9:b0:ac4:3d8:2e90 with SMTP id
 a640c23a62f3a-ac403d83d5bmr1690261566b.13.1742972384898; 
 Tue, 25 Mar 2025 23:59:44 -0700 (PDT)
X-Received: by 2002:a17:907:c5c9:b0:ac4:3d8:2e90 with SMTP id
 a640c23a62f3a-ac403d83d5bmr1690259666b.13.1742972384480; 
 Tue, 25 Mar 2025 23:59:44 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac6eb3ca875sm42092166b.157.2025.03.25.23.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 23:59:44 -0700 (PDT)
Message-ID: <fa4043a9-6978-45dc-ab1c-43bbab1572b6@redhat.com>
Date: Wed, 26 Mar 2025 07:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 02/12] hw/block/m25p80: Categorize and add
 description
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-3-philmd@linaro.org>
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
In-Reply-To: <20250325224310.8785-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HXsUNoHkVrK7o_BkBLSWD5q3IaM0usTrXMhW9yDjUCY_1742972385
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: vqRWXXhNtZoq

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/block/m25p80.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index b84c6afb327..0887c103e4f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1870,7 +1870,9 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
>       dc->vmsd = &vmstate_m25p80;
>       device_class_set_props(dc, m25p80_properties);
>       device_class_set_legacy_reset(dc, m25p80_reset);
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       mc->pi = data;
> +    dc->desc = "Serial Flash";
>   }
>   
>   static const TypeInfo m25p80_info = {

Reviewed-by: Thomas Huth <thuth@redhat.com>

