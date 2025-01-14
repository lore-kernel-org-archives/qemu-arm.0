Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2610986njn;
        Tue, 14 Jan 2025 10:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWMdhlLXEyG2c+dvb3tVWqaIWbV4QreM5lMN+BPjAmfLLje0aboaiDUzTlmtKlO0x9GXNDj93q1pPDUw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZU5+b5zeQVremfeMB7nq7judQNQSkPGvli/BA4EsFw/m5LLk97FQNtoH2WcR3erB8IpAh
X-Received: by 2002:a05:6102:54a4:b0:4b0:ccec:c9de with SMTP id ada2fe7eead31-4b3d0ecc1ecmr24894624137.24.1736879793160;
        Tue, 14 Jan 2025 10:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736879793; cv=none;
        d=google.com; s=arc-20240605;
        b=DEHrMoq2EvRMCbfGYiQh4fW7l6p5IX/eSCjwApwVOzJjxzB5Rya78Rs8ySQktjehTa
         ANwcLGoU9CESkodHRQ6DeIeMYyADw5CsY26i3tMnHEBBCkfj33IGhaWJQBTvaWBt9oiY
         mm2e7DMbMhnA+JEHWbSWp0Hnz64wuB2oicuXhx5Z8BM/ZB59G4/6+WWt0UtVJUJuetgF
         xUKYo1LaPcIOoecpUS80pM5lLSUD1VJ2q/ImC1C8n0sFVjaR4M0a4ab/7n2ikck8FM3D
         eyyl6v//HG1DBsQHCJnMbqvSXW+sRDlk1IQz4nKTln31ThARZQq70bIeR+vKO6hOggvZ
         k7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=MnvopJm97Gd58xI/NgjEBzbEHNw4rHmblEY9Ig7JHww=;
        fh=hn9N95AaO6J6zq/OlnCvq0HhY3BHtI+M3rNRhUyde6s=;
        b=JlDZot6ofK2TkG1ZqFApI76BGjguOCa+8XfGi9WBNhX4eYf+YLSY/YkvFE4XXhrqIr
         d21bi/47a5/3Spg/ot6wc9WxuhDW2f//ZwYhigpyeR0RRXaf6vvj9rrZAgSlxCYDrFly
         m79e6/tGlPdAbVZTohWsqEr8NXgtisuMLXr0asekVOgHTNE+o9NbpJUIgTDg5Z6abZxX
         HX5sCUTCU+e6L55vLLtxXUMvfmqD9xwWQiU9CAYfJJlexyXP3MyGw2yaPqEqT0tpn68v
         PL+igE4ud08ISPrsApl4WJmKbTJFmwI2sdSu3NLcMydJyhHg0WWCIY0sDrld47X5M2Ss
         parw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b608fb2d67si3770361137.30.2025.01.14.10.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 10:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXlls-0000HQ-AE; Tue, 14 Jan 2025 13:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXllk-0000G6-3i; Tue, 14 Jan 2025 13:36:04 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXllh-0008M6-Ny; Tue, 14 Jan 2025 13:36:03 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXd485Cjqz6K9P4;
 Wed, 15 Jan 2025 02:31:04 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id B6F36140680;
 Wed, 15 Jan 2025 02:35:57 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 19:35:56 +0100
To: <qemu-devel@nongnu.org>
CC: <Jonathan.Cameron@Huawei.com>, <anisinha@redhat.com>, <armbru@redhat.com>, 
 <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>, <farman@linux.ibm.com>,
 <imammedo@redhat.com>, <jiangkunkun@huawei.com>, <linuxarm@huawei.com>,
 <mst@redhat.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, <richard.henderson@linaro.org>, <sarsanaee@gmail.com>, 
 <shameerali.kolothum.thodi@huawei.com>, <shannon.zhaosl@gmail.com>,
 <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: RE: [RFC PATCH v6 0/6] Specifying cache topology on ARM
Date: Tue, 14 Jan 2025 18:35:55 +0000
Message-ID: <20250114183555.468-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114180611.353-1-alireza.sanaee@huawei.com>
References: <20250114180611.353-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.72.65]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.794, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TQcBoUCLz99L

Apologies for the duplication. I needed to resend this patch set because I 
inadvertently included an extra patch in the version I sent a few minutes ago. 
I have now removed the additional patch and resent the corrected set.
