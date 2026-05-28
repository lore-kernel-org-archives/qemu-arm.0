Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F02DCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:15:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wScRy-0002Tl-5E; Thu, 28 May 2026 11:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wScRo-0002NT-Kc
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wScRm-0006Mx-VY
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779981297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/+bC7QjDQS+fTuqHVrJHYLhO5StgoEy46exv+WFnTk=;
 b=RYYqjzCueIcvQ++lSf85na6V7u/DcQRqCpAWWNxJHACeQOiM6ZBvoDWviaNuFJumUSXsQO
 SGRnUFsSdUhSxZtE9NU57CoKoHhDEYCSBtcr3mVnTTjYcqhjAYEnUemHRyDUt+pWHXXbrt
 p+3B52i14bUUp1sa9WKlrurqkndHuuA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-j05njBIuOPeowiXSb1Jo9g-1; Thu, 28 May 2026 11:14:54 -0400
X-MC-Unique: j05njBIuOPeowiXSb1Jo9g-1
X-Mimecast-MFC-AGG-ID: j05njBIuOPeowiXSb1Jo9g_1779981294
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44dad1b938fso7542235f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779981293; x=1780586093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/+bC7QjDQS+fTuqHVrJHYLhO5StgoEy46exv+WFnTk=;
 b=HZiJHiDMP4giivzgo0KjzHIAlztmjPxwxXENlY/Lxk5cs7aY2Kw/UIJ1+j1l0hlUrP
 DRl7k8vdgpFupMfg2SOJ2XREbtDXJLIdQZ1UA40IcOGFO6YKoLlvpKwgfSp8fQlUq7BY
 c9zaYpqRqUDxQ86IySxZTtQNk+BMAbMnyAd4rguCxyy/jdWGFu4/T8kzqmi2mxfobGJ3
 adh63nAabTU+GanuoSoBhX+U1iJVUBmgkcR4+IJ3wvkalgDwhC6b+w+ASMPlCK6fwVu2
 7EDOMMNFXeOGC7+LDlDD0LFiJNTbqIGxyfyv2wwPK7CzkRVZ6B4wTkWpFLohoLt7eCUO
 Zvcg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I2qgsoco+eW1c9I7IUvJW9UHUGKNF4Ca1LESfx1M6IxVVbbVBKLiw4zMmioU+y80/OY0uNJsmKg==@nongnu.org
X-Gm-Message-State: AOJu0YxXC7UkTpfxBm57eKrJK/jYrwJ8JCV7w52UhdbRnuEspBAqZ+lj
 VLhZQ8+yUcW8VdM8BgZ4i73YFOgLqQpdHJquYX3Z3tEjamfDipnti7pSERT8FEHtzQjau3G/WjA
 FeSz3aJ8ke8dsADBDhpd+Pu3p2wQkJ0h+aYReDuTMAG1te8gin8bo8w==
X-Gm-Gg: Acq92OEwAJuJSI5Lqw0CMNMMCPC1tOGtmelCCRIr+sitMcRCNNn74u6UNwpqEPKv/7F
 b/qp5C1X7DfaA3iWHb2FyAmVLhAIUtsUPb5M5CjpZGrw36qJLaOD9Mz/wYWamOGrWoWoMpbRhQG
 v+5Wayuqb0NSwxqYEVCMGNM5Q8aF9ordvO9NdRYZzpd1xN0ror244O0kYqzEdqsCaVuHMf/ARzT
 Guc2hS21j/CKml9zXt41LVyGipiEWmo/3mrXwIsfUP4fWbbSiVPEnCLlRNa+QXHUi+gHPNh3v35
 i22qx/z4IoqxHcwcL8FuqCIBe5MCSMx+bPCuhgTL233z0EnkQaIOBIn6UcroW1EwDz3XBgsjaJf
 ZFI+dhq1p35Zs127NJ5MhN5tTdPRB+DsBLqDofc077hsn1D6CJXZcPpSrVM1uWbpe4QbcITdahr
 jhlXO/
X-Received: by 2002:a05:6000:400c:b0:45e:b2b7:1863 with SMTP id
 ffacd0b85a97d-45eb38a8507mr45091486f8f.16.1779981293657; 
 Thu, 28 May 2026 08:14:53 -0700 (PDT)
X-Received: by 2002:a05:6000:400c:b0:45e:b2b7:1863 with SMTP id
 ffacd0b85a97d-45eb38a8507mr45091427f8f.16.1779981293242; 
 Thu, 28 May 2026 08:14:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb549e79sm15071313f8f.7.2026.05.28.08.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 08:14:52 -0700 (PDT)
Message-ID: <6a402e30-91c1-4be7-aa93-0c287839bac2@redhat.com>
Date: Thu, 28 May 2026 17:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/18] target/arm/cpu: Expose writable ID reg field
 properties on the kvm host vcpu model
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-17-eric.auger@redhat.com>
 <30F66A6A-E26B-486C-81D1-8E1B2CCB558A@nutanix.com>
 <6c14a58a-60ab-419f-9395-ca3489f6cff8@redhat.com>
 <CA136979-E0CC-420E-9271-63CF27CD7DA5@nutanix.com>
 <2fd2057d-c74b-4bbe-b2d0-cb9ed092a37d@redhat.com>
 <6F6ECB0E-82A8-4FFA-8687-2D6E243A2096@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6F6ECB0E-82A8-4FFA-8687-2D6E243A2096@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5mi6n9aVYC69ovf6GMcTDCkCVBdLr99ufoZTbYN5F-M_1779981294
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 5/27/26 6:11 PM, Khushit Shah wrote:
>
>> On 27 May 2026, at 9:34 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> On 5/27/26 5:56 PM, Khushit Shah wrote:
>>> So you are saying, if I do, 
>>> -cpu host,sve=on,SYSREG_ID_AA64PFR0_SVE=0
>>> QEMU will still show sve capabilities to the guest?
>> Yes that's what I expect. Require more extensive testing though. That
>> could be way to handle coexistence of different levels of granulaity.
>> Lowest level applies first, overriden by legacy compositive options. I
>> guess if you plan to introduce other layers of compositive props you
>> will most probably handle this situation too.
>>
> I am sure this at-least does not work with sve, 
> because arm_cpu_sve_finalize() just takes looks at the PFR0.SVE field and If value is 0 sve is 'off' otherwise 'on’.
ID_AA64PFR0_EL1 SVE field is not writable if I am not wrong. Only
ID_AA64ZFR0_EL1.SVEver is

        ID_FILTERED(ID_AA64PFR0_EL1, id_aa64pfr0_el1,
                    ~(ID_AA64PFR0_EL1_AMU |
                      ID_AA64PFR0_EL1_MPAM |
                      ID_AA64PFR0_EL1_SVE |
                      ID_AA64PFR0_EL1_AdvSIMD |
                      ID_AA64PFR0_EL1_FP)),

Eric

>
> What you describe might work for legacy props backed by prop_* boolean variables in ARMCPU like pauth (backed by cpu->prop_pauth).
>
> I have not tested this. I maybe wrong if some prop ordering magic happens at machine level.
>
> My plan is to just parse properties in order they arrive in cmdline :)
>
> Warm Regards,
> Khushit


