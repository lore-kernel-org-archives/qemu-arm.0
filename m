Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3942266lfk;
        Mon, 13 Dec 2021 02:02:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQQ5nXQ5HGSA/+14rDJJWdVioy6rJpyqjVtB8pQ8iSo65Pc69KQkHrNLe055UvpIuBNX5B
X-Received: by 2002:a0c:c186:: with SMTP id n6mr40996570qvh.117.1639389755067;
        Mon, 13 Dec 2021 02:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639389755; cv=none;
        d=google.com; s=arc-20160816;
        b=twvPtYGtU5S47MLHu8DUJr43RX5wWlwc2b56zFtEddpgOiGZv5IssveUAb4hqG60tG
         malYcMaTiZT+1xDp08WHpIi3xTCNu54YLiQ4x7JVPfeIMPVKl0hrwVJ4Re8u5UNgjDtS
         hZ8tIIvOjXT6tTKhTdE69xs84yg73DamXNEBjcMfnZPCVhqGNIbwSmEppLRLMibm2lIm
         ph4ybrSeviGrTaP31B97dnhktV7j9tnWXS/FiVPB+Ls7URqmfKd460A2VnizdO5e7iQK
         xTBPh+I9rVkSU86E/AZLeJRx7SdhKxtSIs8WmekW0DExe7fAS9FKcUE6TSNUng9654m2
         7H6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KaE1V+fVD7OLKOljNx1IDFA7uDQo9ORBeTvN2cT7sI4=;
        b=gfF+cW4bqPM56A4K9BF8phAORZanvdslZKn+RdOMsA2fxETITufsNTt1UpDeH2d5q9
         2qrkQ27xzXAWO7AnnrxtaTjpDSdPPkEQhSxl3nBY7SXN6B99NlKZM9AIJaDzmLD2MT55
         mMGDJe24mOr1c09DthD7+fz5wafdKxM46WGhMRSzLN57w+z3GsfD+pq+xtZCqEyFf2AD
         N7j4S/Z4JKynoKubtHUlulRHg3A4My9Nf0f/1WcLE62FMtw70K4x00E08BwJThyMpwBe
         ECdWPzHOIK6XNS9NJ8vMcREqAjeKNLxVImGhU2WIANmSB/ACSIFGdLpgKRVp6NE6LItJ
         A15g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J46IrCQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si12554553qko.444.2021.12.13.02.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 02:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J46IrCQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwiAE-0001eM-It
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 05:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwiA4-0001a1-8v
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mwi9v-0001DR-K4
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 05:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639389734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KaE1V+fVD7OLKOljNx1IDFA7uDQo9ORBeTvN2cT7sI4=;
 b=J46IrCQSQBvoo2Qqwgt4Dk6h+bNNntZGc7c7GaKWj3Nx4grWB1hJ+21QyfrNnucc0N03YX
 mp5zjFTAUF8NvwAjSRAAwO9uTt+urgByQ69joMBSCoGqMYSkHRHqHms83zLohWZsQpuUrI
 X1dv/47SO8bC6Stl0vf9zT7ZhGO7Uzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-2jkVydpNOZS8EUzhYdIwnA-1; Mon, 13 Dec 2021 05:02:13 -0500
X-MC-Unique: 2jkVydpNOZS8EUzhYdIwnA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so3677848wro.18
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 02:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KaE1V+fVD7OLKOljNx1IDFA7uDQo9ORBeTvN2cT7sI4=;
 b=LaoZfT/Bm/3qxWQog3MnCVy9YzGd1Fx1vXaU0RToSLZ+DGMdrReK94GqMwNK7HBM1r
 lxfHAhGiTnCnYqNTEPUf79bxt0i+vphvPS71friFeD4QvfzU0wGJCfeFabi1StyN4a4a
 UBDk6uoy5741+hf55+o995jVbWNMffoj81aKHyjYmoNfty04vMcvJUQDXTJZkIgqfC0s
 b9xW/bRO0Cq/Hq/FOs2ILMkQ0PKccuTrQ+EJYQquanpaLAtiJTQJTjUhTIV3InJJRGi7
 jBTnTH/A0e5nVfWgPtehHCxBA4hsyUeekPGgsl139BG1arfm5SCRTlUYZ3CRQ5o5w0t+
 l/8g==
X-Gm-Message-State: AOAM530JMknQdO7h358UXHsgAKp+xS3ikWx+Zqtzhf6gqjm5zF8/Z365
 4E2PtS/kQoRDfzg8bOdpIeD2ruTuK+A29GhhRK79jQreRCkwN7ukcA+2lT0y2Gpc/NRGDxhv8RX
 ogXaZgBcbdQaw
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr36470132wmi.178.1639389732097; 
 Mon, 13 Dec 2021 02:02:12 -0800 (PST)
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr36470092wmi.178.1639389731770; 
 Mon, 13 Dec 2021 02:02:11 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id y15sm14753998wry.72.2021.12.13.02.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:02:11 -0800 (PST)
Message-ID: <42569854-21ab-a821-49ac-8ab04c5e874d@redhat.com>
Date: Mon, 13 Dec 2021 11:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 0/4] virtio-iommu: config related fixes and qtest
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
References: <20211127072910.1261824-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ByoeWLkdFbM8

On 27/11/2021 08.29, Eric Auger wrote:
> Introduce a qtest for the virtio-iommu device. The test
> allowed to identify an endianess bug in the get_config().
> We also remove the unneeded set_config() and fix the value
> for domain_range.end field.
> 
> Best Regards
> 
> Eric

Thanks, I've queued the series now to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas


