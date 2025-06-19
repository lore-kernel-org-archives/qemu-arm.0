Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp145087njc;
        Thu, 19 Jun 2025 02:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlKKYsDRu/6tdnTCvA9xeek4TryKa25bPguRfoyDWfoqrJbFP+dyKuVSjW14cPjRlPAR+dqUt7lxDF6A==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ21gow8ZGAswiIaOU1BLZ8szbembao2b1c1HvK8AwaqBXlAbqACqp2wytGuSP2/UKJTOj
X-Received: by 2002:a05:620a:2954:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3c6c1ab9fmr3078863885a.21.1750326082355;
        Thu, 19 Jun 2025 02:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750326082; cv=none;
        d=google.com; s=arc-20240605;
        b=K+o0GY/7ad124G3wAGs7Gd0AyUCp5+1R8cX9jD3hRwLAnFc48vygWhT7CXC5mybaZp
         YE4FtiYRgEzODgHdELlvcM6o/aur0yrMl9pzkxXj+JCgL7YK9R+EzbQFDy8fNLph0eYm
         1xzMTfDfO0Rqdj23CuTC744sIrAi99OiVmJqkwhwMkONzRX0nbJCuxt8dgvWFNLCXXyi
         d/HJDa4epig1caf8biCBjpS8tiRCB7xz3fi5xeqZn0p8DEKKpMXfOW1lVW11L9GIjN9/
         Dvub6HS6ksK0EyMzyhnaH+YOQ4sVHPbqCoTTZoJ45hAcve2Iv9bZmtUBhYKmi5HkYp+M
         lFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zgIO8oizntYZXkxpJgcEY7P1RygKVLeXPs5Y6uuqVJA=;
        fh=TJOvBI0MJUL82w/YGnJEYnAXMXMSvJmL1TcXOnvogO8=;
        b=DFkVnFO8T0nJSLK3zUoB1+GKG0+ERML6wbcJtpqI8yGQIyajtQ+fdlet6NIsfC+4XR
         WY0qeWeFdPNDvtjuQKIHzOvxGua1s74SBH1sICuzOJoD3GcH3x9QaNCfjyYuyKSksbk0
         rVJiKk0g16YuL+qc6XU3yVafWfS7QmbXR+576B6D4Zyy3c1b5caULCbLI/N0UbA/IyK0
         8piV5vo+W7ccLeJgDCa+W6UinYUiJYOy0/SWLghxNB18aighTtb/4a2HLQX0aIRyQqIi
         aeZKaJOU/uAU2ficRt4SQmQobvUB9YkTGlF0O4wvjBV+qEsB6Mjl3kh5/wTLkkNUE/zJ
         OeHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlzEVtXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc7980si1591641985a.73.2025.06.19.02.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 02:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlzEVtXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSBle-0006FD-PG; Thu, 19 Jun 2025 05:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSBlV-0006Ek-U3
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 05:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSBlR-0004qc-SB
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 05:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750326057;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgIO8oizntYZXkxpJgcEY7P1RygKVLeXPs5Y6uuqVJA=;
 b=HlzEVtXN8RjJiftgMYUpyavwCzuwjwqElJEHnDq8Jxngf7/J/auS35zc0zVtUJeLsg1lx6
 Ea+b5BPDtr1YkaLYzK4U9Yj9X2ORGItHK5vVMxzWIlpXhb51Wcq2uLeMu4g11pjqZyu3Jf
 FeR0DYqNaBFz9pkcpM9Jqxe6NUgLBwU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-ZHVDzWGWPIy9iXtClB1PWg-1; Thu, 19 Jun 2025 05:40:53 -0400
X-MC-Unique: ZHVDzWGWPIy9iXtClB1PWg-1
X-Mimecast-MFC-AGG-ID: ZHVDzWGWPIy9iXtClB1PWg_1750326052
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45320bfc18dso2522925e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Jun 2025 02:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750326052; x=1750930852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgIO8oizntYZXkxpJgcEY7P1RygKVLeXPs5Y6uuqVJA=;
 b=a/9a8nu4NdKfH428U2UA+wmc1C9Fqj9cCfizN89MK6f/urQUNAIJA5s0R1TZ+5WHwH
 W2MIUdXM3Um7O7GVPI3pXqy2QiJqleqBn8zhHMLvsJedTtPqZVMmnncz9+UV7SPZVkvS
 Q4zL/xyM/aOTtahwpW/LxzDCR41WoxNfL2D5j4JlOR3z4i0kSNBfdkp8M8eYIh24zx0B
 dgYFj1FwQ/7OQe8CLzsHF/lwV2dlqc4ek9AVeWWIMtuScKTy4ODXOF1mQgSZ4596OWAN
 1IZIkAVOZwoW8WtU9xWrVbgB6olvEhUcBQawoh+l0e3T86Jcezr8/pnOlp5pSrbz1uoQ
 iuYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjBjBXI6udCyFUOSC+9czqZm+EZIFNuFXrRRGELF8hufxJavxqOWnSmcpQt2DufSpmoiDsjazthw==@nongnu.org
X-Gm-Message-State: AOJu0YxCxnUqv5MGrQwgetNnGBbXa8R731JgQN8M1do6sSbkbCt1I+Eb
 2F3qQJtDSad2YE/DfFlOmsF+Fs4ya45NJBftymNLD/i+bjQhxB2T+iUCW30wGHlfBwE1lt8V0dr
 h1jbrDtU/jE6SbIGZTDH8FD4z4MxuH0phtcWr+7xz4bnjOWbheB3nHA==
X-Gm-Gg: ASbGnctgsT4gIYQlqqD3bsklF+2QM6f2zkGBwzpD7L0WXAuesnmZkgdmOCHqAL+V2+q
 K97xX4uqDDWMMvVe2yTKDG3qRm02/zt9/CqELcddo2UkYFHdtL+RJ/mylDC3MsAnRJ5r3lzX9q3
 x0s9P4xe4bmsrlZH+7IuSYA5YFIKmNGgQ3GO+2YEa9P5oT83JrkU86jc3JpTZ8cOi0zqQJEUVcE
 oBJBGmEaSSiPRZO4XQ6DXA0bXz7L0EmYKapUcsQMSayQQtNsMWglxFrEg0EHMh1AU/2YTTFGdEy
 ldWEqrq1pmrcPBZgjLIlu+crGZRwN6hS5ws7Kh4Ci5UXTLk9w1kjWjYA61/UgpctsqCvVA==
X-Received: by 2002:a05:600c:8b85:b0:453:10c1:cb21 with SMTP id
 5b1f17b1804b1-4535ec78fb7mr27581845e9.8.1750326052231; 
 Thu, 19 Jun 2025 02:40:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b85:b0:453:10c1:cb21 with SMTP id
 5b1f17b1804b1-4535ec78fb7mr27581595e9.8.1750326051756; 
 Thu, 19 Jun 2025 02:40:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45359c1772csm32970795e9.0.2025.06.19.02.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 02:40:51 -0700 (PDT)
Message-ID: <5b9715a1-f3a5-4ac9-820f-510f9e1040ec@redhat.com>
Date: Thu, 19 Jun 2025 11:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Allow virt extensions with KVM
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alyssa Ross <hi@alyssa.is>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "gkulkarni@amperecomputing.com" <gkulkarni@amperecomputing.com>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <20250527062534.1186004-6-eric.auger@redhat.com> <875xgutpuh.fsf@alyssa.is>
 <D3582F3A-B07A-4F05-827C-B030617B77EA@oracle.com>
 <efd4cb44-3d63-43b5-9568-1263ccf7566a@redhat.com>
 <0EA149E9-D637-4BC0-A10F-7B896581A914@oracle.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0EA149E9-D637-4BC0-A10F-7B896581A914@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wt9fN4EVpP2OGWnu2n60FiRbKiyWwCPZpdjIZN-kVIk_1750326052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.895,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cTuuXvCsgiB8

Hi Miguel,

On 6/17/25 5:50 PM, Miguel Luis wrote:
> Hi Eric,
>
>> On 17 Jun 2025, at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>
>>
>> On 6/17/25 5:23 PM, Miguel Luis wrote:
>>> Hi Alyssa,
>>>
>>>> On 17 Jun 2025, at 14:17, Alyssa Ross <hi@alyssa.is> wrote:
>>>>
>>>> Eric Auger <eric.auger@redhat.com> writes:
>>>>
>>>>> From: Haibo Xu <haibo.xu@linaro.org>
>>>>>
>>>>> Up to now virt support on guest has been only supported with TCG.
>>>>> Now it becomes feasible to use it with KVM acceleration.
>>>>>
>>>>> Also check only in-kernel GICv3 is used along with KVM EL2.
>>>>>
>>>>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>>>>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Hi!  From what I can tell, this will produce an error on hosts that
>>>> don't support nested virtualization when QEMU is invoked with -accel
>>>> kvm:tcg
>>> I didn’t know '-acell kvm:tcg’ could be used as a fallback mechanism between
>>> acceleration modes. May I ask whether do you manage the ‘-cpu’ type for ‘-accel
>>> kvm:tcg’ with cpu ‘max’ ?
>> Does it exist?
>> qemu-system-aarch64: -accel kvm:tcg: invalid accelerator kvm:tcg
> Maybe Alyssa is referring to ‘-M virt,accel=kvm:tcg,virtualization=on,gic-version=3’ ?
>
> The above didn’t triggered any error. Anyhow if the above does what Alyssa’s saying 
> we would just be missing the check for || !tcg_enabled() in this patch, I believe.
You meant you would report an error only if !tcg_enabled()?

In practice tcg_enabled() does not seem to be set when trying kvm first.

Refering to the ancestor of this feature - which I did not know I
acknowledge-,
https://patchwork.ozlabs.org/project/qemu-devel/patch/1275954730-8196-20-git-send-email-aliguori@us.ibm.com/
it is said:

kvm|tcg tries kvm and fallbacks on tcg if kvm support isn't available

It does not state that each option is evaluated with kvm_enabled() and in case it fails enabling one because the host does not support it, it falls back to TCG.

I checked for instance with already integrated MTE option and if the host does not support it, it does not offer the capability to fall back to TCG.

Adding Peter in TO to get his feeling on this.

Thanks

Eric

Besides

>
> Miguel
>
>> Alyssa, didn't you mean -accel kvm or --accel tcg
>>> But more importantly, is this what you’re referring to?
>>>
>>> Although,
>>>
>>>> -machine virtualization=on,
>>> should work for both '-accel kvm’ and ‘-accel tcg’.
>>>
>>>> but I don't think that's the ideal
>>>> behaviour.  It would make more sense for it to fall back to the first
>>>> permitted accel option that does support running the machine as
>>>> configured, so if hardware nested virtualization is not supported, it
>>>> should fall back to TCG.
>>>>
>>>> I maintain an OS development environment that includes scripts for
>>>> running images in QEMU, where running KVM on those images is a
>>>> requirement.  Currently, those scripts simply force TCG on aarch64.
>>>> With this change, to take advantage of KVM NV support, I'd have to try
>>>> to identify in the script whether NV would be supported.  QEMU would be
>>>> in a much better position to determine this and fall back to TCG if it's
>>>> unsupported, like how the -accel option with multiple values usually
>>>> works.
>>> Thanks,
>>> Miguel
>

