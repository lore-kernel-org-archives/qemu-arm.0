Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AAFCD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 16:05:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSGkn-0007OW-RM; Wed, 27 May 2026 12:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGkm-0007OF-KG
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGkk-00088s-Iv
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779897905;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmx5VvulXmU8ksGA1QX9PtZR7i2VA/lb19l1GvSvoMs=;
 b=O2uK9z13Po90dtj6tyGvzGrwddf9uhKHY9NaA+yna3tZ6SCUd7VFNABnXHERMaeaX19tP6
 EKRTp84ZKhYaKG1wY4zAnGvdmYkv8gnV/VotO9Xfsws9EGp5mNNAjrrzRYOnmXwfg/Kt+9
 +zaSjQXVLZtj49rdcqKswcGh4HitoOk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-8okFo8t3M82kQe9fYWI5_Q-1; Wed, 27 May 2026 12:05:04 -0400
X-MC-Unique: 8okFo8t3M82kQe9fYWI5_Q-1
X-Mimecast-MFC-AGG-ID: 8okFo8t3M82kQe9fYWI5_Q_1779897902
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44b186b715aso7512073f8f.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 09:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779897902; x=1780502702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmx5VvulXmU8ksGA1QX9PtZR7i2VA/lb19l1GvSvoMs=;
 b=ZTRYUrSa16tv9Pr4tQk8q1zdMTvXvFT/mQhCvY1wSuG2ayvpc/C5WUOe9OzEmCW5rG
 7+W2RVmi7fCYOqvZXrNMwkEX2GK8qFQVbKunq4iat4xDTfR7lyuCD5Cdgmw0QY3B0JFn
 Er3CMEBTraH4U2vii8Hz1IH3pANxbWVQiBdDnJXOQzPpiCE0DolTcogzQ9pn3eUV5bC2
 u4jK2V6Hh2arfsEpdNwWp32fVd7XAoNJMS55h+jhi6mDOFWPJZHqV/T/FWNdvgncyRDx
 GmoB4cj4vfxkNrl6nWxTwhVXKR6MrgdNhRKmQQnhzfgSdo+S5fJwQj4ZTUDZWoQutu12
 3iiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pYeYTTdfSKEyzq7bVRIehaESLBGCZn+TJu1ReacYl97p664w63LURjnDflzkysWrsTSyDA9qVkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxVdPx16UypVckHzbpkw+mN1Wa7uMnyreCCZdKnLkumKK21pReG
 5L52AX7y3t4xsf3/vC/Nh3BrHLHwRsfVXFrtVsgkhvznxKoC4hMtLJNbxn9sIC3eGw43LioVRZV
 vD7My7IGt+fWKuAfqM9+zp28wUxBZ3rkEqjAuJ6P6ahN8WIGem5d9rA==
X-Gm-Gg: Acq92OG1Ov35WF//06s0C91nV5gVKfdz6uKGDfceT7NPpIYUeEPnD/t8pXUgb8I/LHw
 TKjFJ1xM+JqcKGTZwSz2xaowyZj5iaZAOZ1PAYJSTPq6W6i5We6EfAmhg4JgIkIr6k+M7etXcs2
 gZwSSzxjhcD+T28AaWLXitP4kA3Qj7HY2OPW83pi6cApsGXNwKpvseH85pIZDbnKZzuexTpeNtQ
 5WblR9drfoPTzgRLr7WJxkxeZCL1GGa5w66wfvLnX02HpMVtq+a6hWGeTfvWXnkV7pN8nNmJgEV
 7pmrqEnEe0JUcK6nXXjY9evlawLiwWdVd4AE0tjDuwIqG/ZYwdSmCW9wmZ8YE1GA9r3jWRxLdnT
 T4rmtKpO9iPAPhcaOdDFe+LkdWjzZ+gdL2OLAuUr3NyBPDvjros8A8lJLPg8YJnhD+LGKX/A2gq
 /HDuNV
X-Received: by 2002:a05:6000:1888:b0:441:1e1e:a050 with SMTP id
 ffacd0b85a97d-45eb38b8a09mr40497347f8f.16.1779897902014; 
 Wed, 27 May 2026 09:05:02 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:441:1e1e:a050 with SMTP id
 ffacd0b85a97d-45eb38b8a09mr40497254f8f.16.1779897901534; 
 Wed, 27 May 2026 09:05:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5a296bsm6557834f8f.21.2026.05.27.09.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 09:05:00 -0700 (PDT)
Message-ID: <2fd2057d-c74b-4bbe-b2d0-cb9ed092a37d@redhat.com>
Date: Wed, 27 May 2026 18:04:58 +0200
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CA136979-E0CC-420E-9271-63CF27CD7DA5@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NPBlHkgvRgZh4hynGtHELjG7tLXFMNPB_DX15SmP2iM_1779897902
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/27/26 5:56 PM, Khushit Shah wrote:
> So you are saying, if I do, 
> 	-cpu host,sve=on,SYSREG_ID_AA64PFR0_SVE=0
> QEMU will still show sve capabilities to the guest?
Yes that's what I expect. Require more extensive testing though. That
could be way to handle coexistence of different levels of granulaity.
Lowest level applies first, overriden by legacy compositive options. I
guess if you plan to introduce other layers of compositive props you
will most probably handle this situation too.

Thanks

Eric


