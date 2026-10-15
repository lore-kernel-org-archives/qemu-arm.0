Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DF7CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 14:06:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHM5m-0006Yu-6F; Thu, 15 Oct 2026 10:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHM5i-0006YT-RA
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHM5g-0002ON-6q
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792073150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ro4VReCJbMXDDulID/D345/NuyZnyk0gEdYTf6PdAuE=;
 b=OPKOrxly26jvCtYY0PuH3bG0W/HFg+d8GPvbT+QC0FRL++F/w16cjYVqKzAgWUpUdFqAx4
 0oYeT8VZUV4KY1IH8g39SbHyIa/NIr9KfuDVvxMQRghIAkGlo6obKVKJ1Rxq0XGi4ZqbiT
 N10UN6JccN98mTk/t9JdaAdjNIhMkY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-IfR-nDaLOTqKoAB_53LwzA-1; Thu, 15 Oct 2026 14:05:49 +0000
X-MC-Unique: IfR-nDaLOTqKoAB_53LwzA-1
X-Mimecast-MFC-AGG-ID: IfR-nDaLOTqKoAB_53LwzA_1792073148
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a01ba12198so57984425e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 07:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792073148; x=1792677948;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ro4VReCJbMXDDulID/D345/NuyZnyk0gEdYTf6PdAuE=;
 b=z4q+B2mA2mDcRQrr5ug34kh5ZY3UynoyI+jeVGp4HAhP3v0TSz5ie5mCGhKLjh318f
 6A0eUdH1n4gVVR4TVypaRDIzJ8yJUdGo/de8CaA0cwelTbZgq+nZpLOXvh5BX8JiPCH9
 4TKFAMkqx6jPAyzDijgJSKiHhbXOfrsV8YzSMXNNBcLUlOFQeI7SM/rZ/sS+ZiPUMKMj
 /obJxbcXuTA5MudAHwcTmhgS72GAVpEiqRymyrvtBbZTVOezXmeCXbq/FsfM9J02qaGy
 lsO6PzQWgm131TXpF7RGMK5xHHGfx6RX0bQyqpPOhzxyrBc//JoAhGY4zbQpb6SAyiln
 YO1g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw+nfMx1gji9Qb+q4m7bHT8mx8kTthr8DIemQAC/+lS8DLWOoZUnCJWuK6zybP5EyFoRpDVLMGSOA==@nongnu.org
X-Gm-Message-State: AFq9FYIiwPytqdgDJ1zLsOxTXquw9cm/7fMnnw7xFi0m4PIJUawKjMGY
 G50SanEsl3sip615MM4AGYq1LKBrruXYKKTI6hB10Gf1q5poJ0sCSdjzlBC7HxLiLVSp3yDBFY/
 wZ5aX4L8OOVEzku4RSjPK9l1IAy561re2mjRwEgcsmifLZU8H8Nz5EQ==
X-Gm-Gg: AYBFou3EPd3V3BPCF+WYYX2ybZQvTEFzPX+fBL4ZWOU1ZIAXCqTyUVzP34You9uGASk
 xIOAcyJZYmcDwO3GTbsEhRtXsSPsHtHmmX5e4/D+L9kL9R7ihyhNU/2V+mEzYVYhNwjWXxTXy+Q
 A1nHitVtUfw9fOEbgHJfSgVRpqRmC7iPcya77KCU1bxh68qzMBvN8ui+VaI2knkbREjWLh9SZAI
 I5D6ojtVYssJReW9s/v4j1cSiiYt9CMGnTmTwRKLMdAu3x156ndr4bYRHBBun5D0PZQEfXAqD50
 v/1jrCjn4sYJKuaawM6pz4vC7RiLQD7SouYKYfMXrLE41+/6vGXgSwUn/KbMuwOu7AhANLlJCbj
 WyS1cAXcTZeeYgtqYVPxzKBrx9Ed0UwxqX4yvZsCUrYrZV3rT
X-Received: by 2002:a05:600c:2154:b0:4a1:ac66:604b with SMTP id
 5b1f17b1804b1-4a1c6635d20mr2234395e9.1.1792073148401; 
 Thu, 15 Oct 2026 07:05:48 -0700 (PDT)
X-Received: by 2002:a05:600c:2154:b0:4a1:ac66:604b with SMTP id
 5b1f17b1804b1-4a1c6635d20mr2233835e9.1.1792073147927; 
 Thu, 15 Oct 2026 07:05:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd6428b3sm67859615e9.1.2026.10.15.07.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 07:05:47 -0700 (PDT)
Message-ID: <a1245318-1843-45c8-9822-bea483a3e660@redhat.com>
Date: Thu, 15 Oct 2026 16:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 14/25] target/arm: add neoverse-v2-v2 named CPU
 model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, cohuck@redhat.com,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-15-khushit.shah@nutanix.com>
 <395b66c9-4173-401b-b469-8972b710aae2@redhat.com>
 <CAFEAcA8DcLLYJeE_NUKrFTKfYvHp+6YYAmCdZnBfz2AjRNDnzw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8DcLLYJeE_NUKrFTKfYvHp+6YYAmCdZnBfz2AjRNDnzw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cwXtTMU8kmQoiNTg7w-E1oRqrf5QSYic5WhGeVP_6CA_1792073148
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 10/15/26 2:22 PM, Peter Maydell wrote:
> On Thu, 15 Oct 2026 at 13:13, Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Khushit,
>>
>> On 9/21/26 2:32 PM, Khushit Shah wrote:
>>> Add a KVM-only named CPU model for Neoverse V2 r0p1 (TRM 102375),
>>> inheriting from neoverse-v2-v1 (r0p0).
>>>
>>> r0p1 only changes MIDR_EL1.Revision and adds FEAT_ECBHB
>>> (ID_AA64MMFR1_EL1.ECBHB).
>>>  static const ArmNamedCpuModel arm_cpu_models[] = {
>>>      {"arm-v9.0-a-v1", NULL, arm_v9_0_a_v1_props},
>>>      {"neoverse-v2-v1", "arm-v9.0-a-v1", neoverse_v2_v1_props},
>>> +    {"neoverse-v2-v2", "neoverse-v2-v1", neoverse_v2_v2_props},
>> nit I would call it directly neoverse-v2-r0p1 and leave the -v<n> suffix
>> for potential fixes. Same for r0p0 obviously.
> I'm not very enthusiastic about accumulating different CPU models
> for all the different rXpY variations that appear. We used to have
> a ton of basically identical pxa720 variants and I was glad to be
> able to drop those when we deprecated-and-dropped the pxa support.
>
> Is any user actually going to care about the difference between
> r0p0 and r0p1 ? In particular pX changes are just hardware
> bugfixes that QEMU was unlikely to be modelling in the first place.
I do agree. In terms of ID reg, there is very little difference between
both. Modeling a single one may be sufficient

Thanks

Eric
>
> thanks
> -- PMM
>


