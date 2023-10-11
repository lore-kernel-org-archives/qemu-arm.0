Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp227386ejc;
        Wed, 11 Oct 2023 09:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeI1qjuPMoDumPejASpbJL7zVfxegJgCUKL2a+w5ylBiI5FjsUzgqA85Aw/7S7mE2VqZHG
X-Received: by 2002:a17:902:db06:b0:1c4:2ca5:8b7c with SMTP id m6-20020a170902db0600b001c42ca58b7cmr21522684plx.61.1697043483997;
        Wed, 11 Oct 2023 09:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043483; cv=none;
        d=google.com; s=arc-20160816;
        b=qgDFALkeUxNFSm4knI/4BFwS8T+4j/sxKCcOVQlEmlf0748Gm7HmTyXGxokb6kY/AJ
         HxROuqN3+jyVkSouPxPcI4hZM+xfFOWRmrYVrJO+CJfbvnb+dSmzZKSiWDJqJzxQlFv6
         4s4MQbTuol30HixemCSOlIqaUgefOEP5n2BqcBd4DEAHjsri1g4wxrzDXQW32GYmSEWV
         wIQlDTnZdSFkKkHyJ4H1amQ5XlA0e5IZ5YUUIMVRDT5BZYqYC+ftMzSogfjzhwI8JCKQ
         sGRYwQ0C12S9n9Fr/nStIYH3uk9mP4fzHWiBFgt/vOE0s60cKhsk8uiS+D1hsTpONXfi
         hYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=fkd/lp0Vv0yoio+oUWwxCt/5XMxl17GEKqk4n4pj0nM=;
        fh=d3IJm+ZxwSl9KZqvnG2kYCeA8E9nvhcF9D+T4HRJtcU=;
        b=GyTZ6uEw8ugkUN/aNGJDESaHIlvkbq7oLbabyFO7Xl5UUvTsHlsi0njHcpFfDM5Loz
         NLh7rRfbzRWrqOjbReTG6f5KuBPx0UQVfhaVB+aMBT/byPjNYgZXamHkYKiR/FVj56Hw
         zc3tjD66HQUI1tL6I7dywRmrKowHiIrMaqMHLFULb4Z2XdGevl3pgehyjUgMIstDWMpi
         Z/LHyhqz6T50LUSa8VCQE4ffz6mFIqN1y73n4iEo0k8I/Ee3uDrTVfz4MeGEd5fi2wZZ
         lrg+AFzjvolHHQpggJdUGS03/pYyoVeqUejLQuO0kN3i20a/DwKZPSUP5KFQa2zLsYnj
         D79g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="B/EnV9RG";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id e6-20020a170902cf4600b001c7345bc007si94860plg.486.2023.10.11.09.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="B/EnV9RG";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BErI86020533;
	Wed, 11 Oct 2023 16:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=fkd/lp0Vv0yoio+oUWwxCt/5XMxl17GEKqk4n4pj0nM=;
 b=B/EnV9RGymRObZta6os3OfM7Ky2zqXem1oNJa5Rdwe/JbN+B3/XK1TJKzlD3Nt/sZcqD
 gvPJ71tMMFjqCqDzqFMrT5ADzkI5fP8Xy2n2lW4nRQesGsBq3xDoFK3VqmWUplQAhkeh
 EkVcLwW0z9mgaFcck+kkcq1DCkxQo/W6hGb/LonyAXQFprHAljyEWq0rQQ1k2RMVxfd5
 gEpcna1dAcqWt9/KXafNerQ1R9tM+R+Pm8zP/mh5gJG3qvK/t0lgGR4+VlA1D3h1um7a
 iJxXWNnosCSwVDYCt0UZkzskjKLzNjz2EmIIFmMygR1PL0l2TLSm6NF9rH/HZ5GsuRbT Mw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnstys031-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:58:00 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGvxMu008954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:57:59 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 09:57:55 -0700
Date: Wed, 11 Oct 2023 22:27:51 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v0 02/12] update-linux-headers: Include gunyah.h
Message-ID: <20231011165751.GA1130358@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-3-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20231011165234.1323725-3-quic_svaddagi@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0HzssX4kQ_e3kw7Iwdu_A-FnFXtUrynu
X-Proofpoint-GUID: 0HzssX4kQ_e3kw7Iwdu_A-FnFXtUrynu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=777 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110149
X-TUID: AiU+eLIistMc

* Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> [2023-10-11 16:52:24]:

> One of the subsequent versions of the patch is expected to be merged
> upstream soon, after this this change to 'update-linux-headers' can be

Sorry about the typo, will be fixed in next version!

s/this this/which, this

> run against the main Linux kernel source repository from kernel.org.
